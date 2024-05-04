
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../appbar_bottom/navBottomWighget.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../service_provider/proiverList_view.dart';
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


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProviderListView(servicetype: 'Air conditioning repair')),
                      );



                    },
                    child: RoundedCard(
                      title: 'conditioning',
                      subtitle: 'Air conditioning',
                      image: AssetImage(ImageAssets.air),
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){




                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProviderListView(servicetype: 'Electrical repair')),
                      );


                    },

                    child: RoundedCard(
                      title: 'Electrical',
                      subtitle: 'Electrical repair',
                      image: AssetImage(ImageAssets.electric),
                    ),
                  ),








        ]),
        SizedBox(height: 10,),
              Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [





                    GestureDetector(
                      onTap: (){


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProviderListView(servicetype: 'Plumbing repair')),
                        );


                      },
                      child: RoundedCard(
                        title: 'Plumbing',
                        subtitle: 'Plumbing repair',
                        image: AssetImage(ImageAssets.plmpuing),
                      ),
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(

                      onTap: (){


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProviderListView(servicetype: 'Carpentry repair')),
                        );


                      },

                      child: RoundedCard(
                        title: 'Carpentry',
                        subtitle: 'Carpentry repair',
                        image: AssetImage(ImageAssets.carpentry),
                      ),
                    ),




                  ]),




            ],
          ),
        )

    );
  }
}
