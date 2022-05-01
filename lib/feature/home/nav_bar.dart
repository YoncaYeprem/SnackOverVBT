import 'package:flutter/material.dart';
import 'package:snack_over_vbt/feature/home/view/home_view.dart';
import 'package:kartal/kartal.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  int _selectedPage = 0;
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: _tabController,
          children: [HomeView(), HomeView(), HomeView()],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO ekleme kısmı yapılacada
        },
        backgroundColor: context.colorScheme.onSecondary,
        foregroundColor: context.colorScheme.onSurface,
        child: const Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: context.colorScheme.primary,
        notchMargin: 2.0,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: context.dynamicHeight(0.08),
          child: BottomNavigationBar(
            selectedItemColor: context.colorScheme.primary,
            unselectedItemColor: context.colorScheme.primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
