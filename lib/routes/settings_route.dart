import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keep_in_touch/classes/User.dart';
import 'package:keep_in_touch/routes/login_route.dart';
import 'package:keep_in_touch/utils/authentication_utils.dart';
import 'package:keep_in_touch/utils/global_utils.dart';
import 'package:keep_in_touch/utils/app_state.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';
import 'package:keep_in_touch/widgets/app_bar_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  AppStateContainerState container;
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;
  User user;

  bool isLoading = false;

  final FocusNode focusNodeNickname = new FocusNode();
  final FocusNode focusNodeAboutMe = new FocusNode();

  bool _value = false;

  void _onChanged(bool value) => setState(() => _value = value);

  @override
  void initState() {
    user = User("-1", "", "", "", null);
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
            container.updateAppUser(user: container.appState.user);
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

  void handleUpdateData() {
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();

    setState(() {
      isLoading = true;
    });

    Firestore.instance
        .collection('users')
        .document(container.appState.user.id)
        .updateData({
      'nickname': container.appState.user.nickname,
      'aboutMe': container.appState.user.aboutMe,
      'photoUrl': container.appState.user.photoUrl
    }).then((data) async {
      await prefs.setString('nickname', container.appState.user.nickname);
      await prefs.setString('aboutMe', container.appState.user.aboutMe);
      await prefs.setString('photoUrl', container.appState.user.photoUrl);
      container.updateAppUser(user: container.appState.user);
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

  Widget _userInfo() {
    return // Input
        Column(
      children: <Widget>[
        // Username
        Container(
          child: Text(
            'Nickname',
            style: regularText,
          ),
          margin: EdgeInsets.only(left: 20.0, bottom: 5.0, top: 10.0),
        ),
        Container(
          child: Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.green),
            child: TextField(
              decoration: InputDecoration(
                hintText:
                    container.appState.user.nickname ?? 'Write your name...',
                contentPadding: new EdgeInsets.all(5.0),
                hintStyle: hintTextStyle,
              ),
              controller: controllerNickname,
              onChanged: (value) {
                container.appState.user.nickname = value;
              },
              focusNode: focusNodeNickname,
            ),
          ),
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
        ),

        // About me
        Container(
          child: Text(
            'About me',
            style: regularText,
          ),
          margin: EdgeInsets.only(left: 20.0, top: 30.0, bottom: 5.0),
        ),
        Container(
          child: Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.green),
            child: TextField(
              decoration: InputDecoration(
                hintText: container.appState.user.aboutMe ??
                    "Write something about you...",
                contentPadding: EdgeInsets.all(5.0),
                hintStyle: hintTextStyle,
              ),
              controller: controllerAboutMe,
              onChanged: (value) {
                container.appState.user.aboutMe = value;
              },
              focusNode: focusNodeAboutMe,
            ),
          ),
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  deleteAccount() {
    deleteUserWithGoogle(userFirebaseDelete).whenComplete(
      () => setState(
            () {
              userFirebaseDelete = null;
            },
          ),
    );

    Fluttertoast.showToast(msg: 'User Account deleted');
    handleSignOut(context);
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    user.id = prefs.getString('id') ?? '';
    user.nickname = prefs.getString('nickname') ?? '';
    user.aboutMe = prefs.getString('aboutMe') ?? '';
    user.photoUrl = prefs.getString('photoUrl') ?? '';

    controllerNickname =
        TextEditingController(text: container.appState.user.nickname);
    controllerAboutMe =
        TextEditingController(text: container.appState.user.aboutMe);
    // Force refresh input
    setState(() {});
  }

  Widget _getBody() {
    readLocal();

    return Scaffold(
      appBar: appBarModal(context: context, title: 'Settings'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: greyBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //AVATAR
                  Container(
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          (container.appState.user.avatarImageFile == null)
                              ? (container.appState.user.photoUrl != ''
                                  ? Material(
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            Container(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.0,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.pink),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              padding: EdgeInsets.all(20.0),
                                            ),
                                        imageUrl:
                                            container.appState.user.photoUrl,
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(45.0)),
                                      clipBehavior: Clip.hardEdge,
                                    )
                                  : Icon(
                                      Icons.account_circle,
                                      size: 90.0,
                                      color: Colors.blue,
                                    ))
                              : Material(
                                  child: Image.file(
                                    container.appState.user.avatarImageFile,
                                    width: 90.0,
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(45.0)),
                                  clipBehavior: Clip.hardEdge,
                                ),
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                            ),
                            onPressed: getImage,
                            padding: EdgeInsets.all(30.0),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.orange,
                            iconSize: 30.0,
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "USER DETAIL",
                      style: mainText,
                    ),
                  ),
                ],
              ),
            ),

            //USER INFO
            _userInfo(),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "NOTIFICATIONS",
                style: mainText,
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Permitir',
                    style: regularText,
                  ),
                  Switch(value: _value, onChanged: _onChanged),
                ],
              ),
              margin: EdgeInsets.only(
                  left: 20.0, bottom: 5.0, top: 3.0, right: 20.0),
            ),
            FlatButton(
              onPressed: () {
                deleteAccount();
              },
              child: Text(
                "Remove Data and Account",
                style: deleteUserStyle,
              ),
            ),

            // Button
            GestureDetector(
              onTap: handleUpdateData,
              child: Center(
                child: Container(
                  width: 300.0,
                  height: 55.0,
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Save Changes',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: mainText2,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    container = AppStateContainer.of(context);
    return _getBody();
  }
}
