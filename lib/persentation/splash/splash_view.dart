import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saaid/data/firebase_auth/firebase_auth_service.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

final FirebaseAuthService _auth = FirebaseAuthService();

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay(){

    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext(){

    var role =  _auth.getRole().then((value) => {

      if(value !=null){

        Navigator.pushReplacementNamed(context, Routes.newhome)
      }else{
        Navigator.pushReplacementNamed(context, Routes.loginRoute)
      }

    });






  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
 // _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body:   SingleChildScrollView(
        child: Column(


          children: [

            const Image(image: AssetImage(ImageAssets.splashtop),height: 350,
                width: 500,

                fit: BoxFit.fill      ),




            const Center(child: Image(image: AssetImage(ImageAssets.logo),)),


            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.fromLTRB(3,0,3,0),
              child: Center(
                child: SizedBox(width: 200,height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);

                    },


                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold

                      ),


                    ),

                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.fromLTRB(3,0,3,0),
              child: Center(
                child: SizedBox(width: 200,height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.registerRoute);

                    },


                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold

                      ),


                    ),

                  ),
                ),
              ),
            ),



            Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, Routes.forgetpassword);

                  },
                  child: Text(
                    'Need Help ?',
                    style: Theme.of(context).textTheme.headlineMedium,

                  ),
                ),
              ),
            ),


          ],
        ),
      ),


    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
