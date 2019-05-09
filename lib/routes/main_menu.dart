import 'package:flutter/material.dart';
import 'package:keep_in_touch/utils/theme_utils.dart';
import 'package:keep_in_touch/widgets/bottom_nav_bar.dart';

class MainMenu extends StatelessWidget {
  final Widget body;

  MainMenu(this.body);

  Widget _getInfoBarWorkaround() =>
      PreferredSize(child: Container(), preferredSize: Size(30.0, 0.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: _getInfoBarWorkaround(),
      bottomNavigationBar: BottomNavBar(),
      body: body,
    );
  }
}
