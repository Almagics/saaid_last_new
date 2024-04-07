
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../appbar_bottom/navBottomWighget.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../widget/roundedCardWidget.dart';
import '../widget/roundedCardWidgetOptions.dart';

class OptoinsView extends StatefulWidget {
  const OptoinsView({Key? key}) : super(key: key);

  @override
  State<OptoinsView> createState() => _OptoinsViewState();
}

class _OptoinsViewState extends State<OptoinsView> {

  int _selectedIndex = 0;







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


                    RoundedCardOptions(
                      title: 'Customer Support',
                      geticon: Icons.headset_mic,
                    ),
                    SizedBox(width: 20,),
                    RoundedCardOptions(
                      title: 'About SAAID',
                      geticon: Icons.error,


                    ),








                  ]),
              SizedBox(height: 10,),
              Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [





                    RoundedCardOptions(
                      title: 'Share',
                      geticon: Icons.share,
                    ),
                    SizedBox(width: 20,),
                    RoundedCardOptions(
                      title: 'Logout',
                      geticon: Icons.login,


                    ),





                  ]),




            ],
          ),
        )

    );
  }
}
