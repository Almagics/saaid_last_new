
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../appbar_bottom/navBottomWighget.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MainView(),



  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.light
        ),
        elevation: 0.0,

      ),
     // bottomNavigationBar: NavBottom(nopage: _page,),
        body: Container(
          color: ColorManager.white,
          child:  Center(
            child: Column(
              children: <Widget>[
                Text("Home",style: Theme.of(context).textTheme.headlineLarge,),

                const Center(child: Image(image: AssetImage(ImageAssets.logo),)),


                 Row(

mainAxisAlignment: MainAxisAlignment.center,
                  children: [


]),




              ],
            ),
          ),
        )

    );
  }
}
