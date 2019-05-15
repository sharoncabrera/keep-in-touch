import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keep_in_touch/utils/navigation.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

Future<Null> handleSignOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await googleSignIn.disconnect();
  await googleSignIn.signOut();

  navigateToLogin(context);
}
