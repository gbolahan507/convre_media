import 'package:convre/app/constants/colors.dart';
import 'package:convre/export.dart';
import 'package:convre/view/hompage/home_view.dart';
import 'package:flutter/material.dart';




class LayoutView extends StatefulWidget {

  @override
  _LayoutViewState createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {

  final List<Widget> _screens = [
    HomeView(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _selectedIndex = 0;

  Future<bool> _onWillPop() async {
    print("on will pop");

    if (_selectedIndex == 0) return true;

    setState(() {
      _selectedIndex = 0;
      print(_selectedIndex);
    });

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.grey[100],
              onTap: (index) => setState(() => _selectedIndex = index),
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.textBlue,
              unselectedItemColor: AppColors.black,
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                  ),
                  label: 'Communities',
                ),
                BottomNavigationBarItem(
                  icon: Stack(children: [
                    Icon(Icons.notifications_none),
                    Positioned(
                        left: 18,
                        child: regularRobotoText(context,
                            fontSize: 12, text: '0', color: AppColors.red))
                  ]),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Chat',
                ),
              ])),
    );
  }
}
