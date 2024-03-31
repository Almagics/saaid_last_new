import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.mainRoute);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkGrey,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text("Done",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Center(child:
          Image(image: AssetImage(ImageAssets.paymentImg),height: 200,width: 350,

          ),

          ),
          Center(child:
          Text("The amount has been paid successfully",style: Theme.of(context).textTheme.titleLarge,)

            ,),

          const SizedBox(
            height: 30.0,
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(3,0,3,0),
            child: Center(
              child: SizedBox(width: 380,height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.newhome);

                  },


                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text('Back To Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),


                  ),

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}