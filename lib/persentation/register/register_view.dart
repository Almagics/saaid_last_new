
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
import 'package:intl/intl.dart';

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

  final genderController = TextEditingController();
  final birthDayController = TextEditingController();

  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  _getDropDownDecoration({required hintText, required IconData icon}) {
    return InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)));
  }


















  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Image(image: AssetImage(ImageAssets.registerTop),height: 200,
                   width: 500,

                   fit: BoxFit.fill      ),

               Container(padding: const EdgeInsets.all(4.0),
                 child: const Center(child: Image(image: AssetImage(ImageAssets.logo),height: 150,width: 150,)),




               ),


               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Center(
                   child: Text(
                     'Ditch the repair search! SAAID app connects you with qualified technicians for all your home maintenance needs. Plus, our chatbot helps you get started. Sign up and join our community for a hassle-free fix!',
                     style: Theme.of(context).textTheme.headlineMedium,
                   ),
                 ),
               ),


               SizedBox(height: 5,),
               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'First Name',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                   child: AppTextFormFiled(
                     iconData: Icons.pending_actions,
                     controller: emailController,
                     hintText: 'Enter First Name',
                   )),


               SizedBox(height: 5,),
               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Last Name',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                   child: AppTextFormFiled(
                     iconData: Icons.list_alt_sharp,
                     controller: emailController,
                     hintText: 'Enter Last Name',
                   )),







               const SizedBox(
                 height: 5.0,
               ),

               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Gender',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),


               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: DropdownButtonFormField(
                     validator: (value) {
                       if (value == null) {
                         return 'Required*';
                       }
                     },
                     icon: const Icon(Icons.keyboard_arrow_down),
                     decoration: _getDropDownDecoration(
                         hintText: 'Gender', icon: Icons.male),
                     items: ['Male', 'Female']
                         .map((e) => DropdownMenuItem(
                       child: Text(e.toString()),
                       value: e.toString(),
                     ))
                         .toList(),
                     onChanged: (value) {
                       setState(() {
                         genderController.text = value!;
                       });
                     }),
               ),


               const SizedBox(
                 height: 5.0,
               ),

               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Date Of Birth',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: StatefulBuilder(builder: (context, setStateBirthDay) {
                   return AppTextFormFiled(
                     readOnly: true,
                     onTap: () async {
                       final picker = await showDatePicker(
                           context: context,
                           initialDate: DateTime.now(),
                           firstDate: DateTime.now(),
                           lastDate: DateTime(2040));
                       setStateBirthDay(() {
                         birthDayController.text =
                             DateFormat.yMd().format(picker!);
                       });
                     },
                     iconData: Icons.cake_outlined,
                     controller: birthDayController,
                     hintText: 'Enter your Birth date',
                   );
                 }),
               ),








               SizedBox(height: 5,),
               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'E-mail',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                   child: AppTextFormFiled(
                     iconData: Icons.email_outlined,
                     controller: emailController,
                     hintText: 'Enter E-mail',
                   )),


               const SizedBox(
                 height: 5.0,
               ),

               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Password',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                 child: AppTextFormFiled(
                   obscureText: true,
                   suffixIcon: true,
                   iconData: Icons.lock,
                   controller: passwordController,
                   hintText: 'Enter Password',
                 ),),



               const SizedBox(height: 20,),
               Container(
                 padding: const EdgeInsets.fromLTRB(3,0,3,0),
                 child: Center(
                   child: SizedBox(width: 380,height: 50,
                     child: ElevatedButton(
                       onPressed: () {
                         //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                         // Navigator.pushReplacementNamed(context, Routes.mainRoute);
                         // _signin();
                       },


                       style: Theme.of(context).elevatedButtonTheme.style,
                       child: const Text('Register',
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
                       Navigator.pushReplacementNamed(context, Routes.loginRoute);

                     },
                     child: Text(
                       'Login',
                       style: Theme.of(context).textTheme.headlineMedium,

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


