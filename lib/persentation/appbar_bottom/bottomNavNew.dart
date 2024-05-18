




import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saaid/persentation/chatbot/chatbotView.dart';
import 'package:saaid/persentation/favorite/favorite_list_view.dart';
import 'package:saaid/persentation/order/order_list_view.dart';
import 'package:saaid/persentation/profile/profileView.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../Main/main_view.dart';

import '../options/options_view.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class BottomNavBarDemo extends StatefulWidget {
  const BottomNavBarDemo({super.key});

  @override
  _BottomNavBarDemoState createState() => _BottomNavBarDemoState();
}


FirebaseAuthService _auth = FirebaseAuthService();

class _BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MainView(),



  ];

  int _currentIndex = 0;


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MainView();
      case 1:
        return new OrderViewList();




      case 2:
        return new ChatWidget();

      case 3:
        return new Profile();

      case 4:
        return new OptoinsView();

      default:
        return new Text("Error");
    }
  }



  _getDrawerItemWidgetProvider(int pos) {
    switch (pos) {

      case 0:
        return new OrderViewList();

      case 1:
        return new OptoinsView();

      default:
        return new Text("Error");
    }
  }


final indexco = TextEditingController();






  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<String> titleList = ["Home",'Order List','Chatbot','Favorite','Profile'];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _auth.getRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          String role = snapshot.data!;
          if (role == "provider") {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor: ColorManager.primary,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.darkGrey,
                    statusBarBrightness: Brightness.light,
                  ),
                  elevation: 0.0,
                  title: Center(
                    child: Text(
                      titleList[_currentIndex],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: _currentIndex,
                height: 50.0,
                items: const <Widget>[
                  Icon(Icons.restore_outlined, size: 30),
                  Icon(Icons.settings, size: 30),
                ],
                color: Colors.grey,
                buttonBackgroundColor: ColorManager.primary,
                backgroundColor: ColorManager.white,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
              ),
              body: _getDrawerItemWidgetProvider(_currentIndex),
            );
          } else {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor: ColorManager.primary,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.darkGrey,
                    statusBarBrightness: Brightness.light,
                  ),
                  elevation: 0.0,
                  title: Center(
                    child: Text(
                      titleList[_currentIndex],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: _currentIndex,
                height: 50.0,
                items: const <Widget>[
                  Icon(Icons.home, size: 30),
                  Icon(Icons.restore_outlined, size: 30),
                  Icon(Icons.chat, size: 30),
                  Icon(Icons.account_circle, size: 30),
                  Icon(Icons.settings, size: 30),
                ],
                color: Colors.grey,
                buttonBackgroundColor: ColorManager.primary,
                backgroundColor: ColorManager.white,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
                onTap: (value) {

                  setState(() {
                    _currentIndex = value;
                  });
                  
                },
              ),
              body: _getDrawerItemWidget(_currentIndex),
            );
          }
        } else {
          return Scaffold(
            body: Center(child: Text('No role found')),
          );
        }
      },
    );







  }
}