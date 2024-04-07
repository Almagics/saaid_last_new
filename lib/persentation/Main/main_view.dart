
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../appbar_bottom/navBottomWighget.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../widget/roundedCardWidget.dart';

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

     // bottomNavigationBar: NavBottom(nopage: _page,),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[


              const Center(child: Image(image: AssetImage(ImageAssets.logo),)),


               Row(

        mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GestureDetector(
                    onTap: (){


                      Navigator.pushReplacementNamed(context, Routes.providers);


                    },
                    child: RoundedCard(
                      title: 'Card 1',
                      subtitle: 'Subtitle 1',
                      image: AssetImage(ImageAssets.logo),
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){


                      Navigator.pushReplacementNamed(context, Routes.providers);


                    },

                    child: RoundedCard(
                      title: 'Card 2',
                      subtitle: 'Subtitle 2',
                      image: AssetImage(ImageAssets.logo),
                    ),
                  ),








        ]),
        SizedBox(height: 10,),
              Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [





                    GestureDetector(
                      onTap: (){


                        Navigator.pushReplacementNamed(context, Routes.providers);


                      },
                      child: RoundedCard(
                        title: 'Card 3',
                        subtitle: 'Subtitle 3',
                        image: AssetImage(ImageAssets.logo),
                      ),
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(

                      onTap: (){


                        Navigator.pushReplacementNamed(context, Routes.providers);


                      },

                      child: RoundedCard(
                        title: 'Card 3',
                        subtitle: 'Subtitle 3',
                        image: AssetImage(ImageAssets.logo),
                      ),
                    ),




                  ]),




            ],
          ),
        )

    );
  }
}
