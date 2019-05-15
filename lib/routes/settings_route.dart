import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keep_in_touch/routes/main_menu.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/utils/app_state.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  AppStateContainerState container;
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;

  bool isLoading = false;

  final FocusNode focusNodeNickname = new FocusNode();
  final FocusNode focusNodeAboutMe = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        container.appState.user.avatarImageFile = image;
        isLoading = true;
      });
    }
    uploadFile();
  }

  Future uploadFile() async {
    String fileName = container.appState.user.id;
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =
        reference.putFile(container.appState.user.avatarImageFile);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then((value) {
      if (value.error == null) {
        storageTaskSnapshot = value;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          container.appState.user.photoUrl = downloadUrl;
          Firestore.instance
              .collection('users')
              .document(container.appState.user.id)
              .updateData({
            'nickname': container.appState.user.nickname,
            'aboutMe': container.appState.user.aboutMe,
            'photoUrl': container.appState.user.photoUrl
          }).then((data) async {
            await prefs.setString('photoUrl', container.appState.user.photoUrl);
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: "Upload success");
          }).catchError((err) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: err.toString());
          });
        }, onError: (err) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: 'This file is not an image');
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: 'This file is not an image');
      }
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: err.toString());
    });
  }

  Widget _getBody(AppStateContainerState container) {
    readLocal(container.appState.user);
    controllerNickname =
        TextEditingController(text: container.appState.user.nickname);
    controllerAboutMe =
        TextEditingController(text: container.appState.user.aboutMe);
    return Scaffold(
      appBar: appBar(
        context: context,
        isChatMenu: true,
        isleading: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    container = AppStateContainer.of(context);
    return MainMenu(_getBody(container));
  }
}
