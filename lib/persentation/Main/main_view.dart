
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../section/sectionListView.dart';
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


                  Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: GestureDetector(
                      onTap: (){


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SectionListView(mainGroup: 'Lawn and Garden Care',)),
                        );



                      },
                      child: RoundedCard(
                        title: 'Lawn',
                        subtitle: 'Lawn and Garden Care',
                        image: AssetImage(ImageAssets.lawn),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),

                  Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: GestureDetector(
                      onTap: (){




                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SectionListView(mainGroup: 'Electricity',)),
                        );


                      },

                      child: RoundedCard(
                        title: 'Electricity',
                        subtitle: 'Electrical wiring repair and more',
                        image: AssetImage(ImageAssets.electricity),
                      ),
                    ),
                  ),








        ]),
        SizedBox(height: 10,),
              Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [





                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: GestureDetector(
                        onTap: (){


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SectionListView( mainGroup: 'Painting and Caulking',)),
                          );


                        },
                        child: RoundedCard(
                          title: 'Painting',
                          subtitle: 'Painting and Caulking',
                          image: AssetImage(ImageAssets.Painting),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: GestureDetector(

                        onTap: (){


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SectionListView(mainGroup: 'Plumbing',)),
                          );


                        },

                        child: RoundedCard(
                          title: 'Plumbing',
                          subtitle: 'Fixing leaks (faucets, pipes)..',
                          image: AssetImage(ImageAssets.plumbing),
                        ),
                      ),
                    ),




                  ]),




            ],
          ),
        )

    );
  }
}
