import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/init/lang/locale_keys.g.dart';
import '../add_question/view/add_question_sheet.dart';
import '../profile/view/profile_view.dart';
import 'view/home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  List pages = [const HomeView(), const ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addQuestionBottomSheet(context);
        },
        backgroundColor: context.colorScheme.onSecondary,
        foregroundColor: context.colorScheme.onSurface,
        child: const Icon(Icons.add),
        elevation: 2.0,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: LocaleKeys.home_homeText.tr()),
        BottomNavigationBarItem(icon: const Icon(Icons.person), label: LocaleKeys.home_profile.tr()),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: context.appTheme.colorScheme.onSecondary,
      unselectedItemColor: context.appTheme.colorScheme.background,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Future addQuestionBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: context.normalRadius),
        ),
        builder: (BuildContext context) {
          return const AddQuestionSheet();
        });
  }
}
