import 'dart:io';

class User {
  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';
  File avatarImageFile;

  User(this.id, this.nickname, this.aboutMe, this.photoUrl,
      this.avatarImageFile);
}
