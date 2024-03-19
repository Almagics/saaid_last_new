
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  //final FirebaseAuthService _auth = FirebaseAuthService();
 // final  _store = FirebaseFirestore.instance;


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
 // final idController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  //final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
 final addressController = TextEditingController();

  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body:  SingleChildScrollView(
            child: Form(
              key: _formKey,
             child: const Center(child: Text('Sign up Not Ready',

             style: TextStyle(
               color: Colors.blue
             ),

             ),),
            )
        ),
      ),
    );
  }

  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Error'),
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


