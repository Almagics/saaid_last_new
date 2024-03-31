

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../resources/assets_manager.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';


class OrderNewView extends StatefulWidget {
  const OrderNewView({Key? key}) : super(key: key);

  @override
  State<OrderNewView> createState() => _OrderNewViewState();
}

class _OrderNewViewState extends State<OrderNewView> {

  //final FirebaseAuthService _auth = FirebaseAuthService();
  // final  _store = FirebaseFirestore.instance;


  final supjectController = TextEditingController();
  final infoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();







  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.white,),
          onPressed: () {

            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkGrey,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: const Center(child: Text("New Order ", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),)),
      ),

      body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Container(padding: const EdgeInsets.all(4.0),
                  child: const Center(child: Image(image: AssetImage(ImageAssets.logo),height: 150,width: 150,)),




                ),




                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Supject',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: supjectController,
                      hintText: 'Enter supject of your order', inputFormatter: null,


                    )),


                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Order Details',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.list_alt_sharp,
                      controller: infoController,
                      hintText: 'Enter Order Details',
                      minLine: 5, inputFormatter: null,
                      maxLine: 8,

                    )),









                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.fromLTRB(3,0,3,0),
                  child: Center(
                    child: SizedBox(width: 380,height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.payment);
                          // _signin();
                        },


                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('order Now',
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
          )
      ),
    );
  }

  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


}


