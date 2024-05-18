
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saaid/data/sections/sectionModel.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../../data/models/userModel.dart';
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

  final FirebaseAuthService _auth = FirebaseAuthService();
  final  _store = FirebaseFirestore.instance;


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

  final ServiceType = TextEditingController();

  final sectionController = TextEditingController();

  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isProviderClicked = false;

  bool isUserClicked = false;


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



               Container(padding: const EdgeInsets.all(10.0),
                   //margin: const EdgeInsets.only(top: 10.00),
                   child:  Center(child:

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       GestureDetector(
                         onTap: () {
                           setState(() {
                             isProviderClicked = !isProviderClicked;
                             isUserClicked = false;
                           });
                         },
                         child: Container(
                           width: 150,
                           height: 150,
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: isProviderClicked ? Colors.red : Colors.blue,
                               width: 2.0,
                             ),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset(
                                 ImageAssets.provider, // Replace with your image path
                                 width: 100,
                                 height: 100,
                               ),
                               SizedBox(height: 10),
                               Text(
                                 'Provider',
                                 style: TextStyle(
                                   color: isProviderClicked ? Colors.red : Colors.blue,
                                 ),
                               ),
                             ],
                           ),






                         ),
                       ),

                       GestureDetector(
                         onTap: () {
                           setState(() {
                             isUserClicked = !isUserClicked;
                             isProviderClicked = false;
                           });
                         },
                         child: Container(
                           width: 150,
                           height: 150,
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: isUserClicked ? Colors.red : Colors.blue,
                               width: 2.0,
                             ),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset(
                                 ImageAssets.user, // Replace with your image path
                                 width: 100,
                                 height: 100,
                               ),
                               SizedBox(height: 10),
                               Text(
                                 'User',
                                 style: TextStyle(
                                   color: isUserClicked ? Colors.red : Colors.blue,
                                 ),
                               ),
                             ],
                           ),






                         ),
                       ),





                     ],
                   )

                   )

               ),







               SizedBox(height: 5,),


               Visibility(
                 visible: isProviderClicked,
                 child: Container(
                   padding: const EdgeInsets.all(4.0),
                   child: DropdownButtonFormField(
                       validator: (value) {
                         if (value == null) {
                           return 'Required*';
                         }
                       },
                       icon: const Icon(Icons.keyboard_arrow_down),
                       decoration: _getDropDownDecoration(
                           hintText: 'Service Type', icon: Icons.home_repair_service),
                       items: ['Lawn and Garden Care', 'Electricity','Painting and Caulking','Plumbing']
                           .map((e) => DropdownMenuItem(
                         child: Text(e.toString()),
                         value: e.toString(),
                       ))
                           .toList(),
                       onChanged: (value) {
                         setState(() {
                           ServiceType.text = value!;
                         });
                       }),
                 ),
               ),

               SizedBox(height: 5,),
               Visibility(
                 visible: isProviderClicked,
                 child: Container(
                   padding: const EdgeInsets.all(4.0),
                   child: FutureBuilder(
                       future: _auth.getSectionsByMainGroup(ServiceType.text!),
                       builder: (context, snapshot) {

                         if (!snapshot.hasData) return CircularProgressIndicator();

                         List<SectionModel> mainGroups = snapshot.data!;

                         return  DropdownButtonFormField(
                             validator: (value) {
                               if (value == null) {
                                 return 'Required*';
                               }
                             },
                             icon: const Icon(Icons.keyboard_arrow_down),
                             decoration: _getDropDownDecoration(
                                 hintText: 'Section', icon: Icons.density_medium_outlined),
                             items: mainGroups
                                 .map((e) => DropdownMenuItem(
                               child: Text(e.name),
                               value: e.id,
                             ))
                                 .toList(),
                             onChanged: (value) {
                               setState(() {
                                 sectionController.text = value!;
                               });
                             });

                       }
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   )
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
                     controller: firstNameController,
                     hintText: 'Enter First Name', inputFormatter: null,
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
                     controller: lastNameController,
                     hintText: 'Enter Last Name', inputFormatter: null,
                   )),

               SizedBox(height: 5,),
               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Address',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                   child: AppTextFormFiled(
                     iconData: Icons.location_city,
                     controller: addressController,
                     hintText: 'Enter Address', inputFormatter: null,
                   )),


               SizedBox(height: 5,),
               Container(
                 padding: const EdgeInsets.all(4.0),
                 child: Text(
                   'Phone Number',
                   style: Theme.of(context).textTheme.headlineMedium,
                 ),
               ),

               Container(padding: const EdgeInsets.all(AppPadding.p8),
                   child: AppTextFormFiled(
                     iconData: Icons.phone,
                     controller: phoneController,
                     hintText: 'Enter Phone Number', inputFormatter: null,
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
                           initialDate: DateTime(2004),
                           firstDate: DateTime(1970),
                           lastDate: DateTime(2024));
                       setStateBirthDay(() {
                         birthDayController.text =
                             DateFormat.yMd().format(picker!);
                       });
                     },
                     iconData: Icons.cake_outlined,
                     controller: birthDayController,
                     hintText: 'Enter your Birth date', inputFormatter: null,
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
                     hintText: 'Enter E-mail', inputFormatter: null,
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
                   hintText: 'Enter Password', inputFormatter: null,
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
                         _signup();
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





  void _signup() async{


    //.clearSharedPreferences();
    String fullname = firstNameController.text +" "+ lastNameController.text;

    // String idNumber = idController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    String birthday = birthDayController.text;
    String password = passwordController.text;
     String  serviceType = ServiceType.text;
     String address = addressController.text;
     String section = sectionController.text;

    String gender = genderController.text;


    String role = "user";


    if(isProviderClicked){

      role = "provider";
    }




    User? user = await _auth.signupWithEmailAndPassword(email, password);





    if(user!= null){
    print("User is successfully created");
    await _store.collection("Users")
        .doc(email)
        .set({

    "Email":email,
    "Password":password,
    "FullName":fullname,
      "BirthDay":birthday,
      "Gender":gender,

"Address":address,

    "PhoneNumber":phone,

    "Role":role,
      "ServiceType":serviceType,
    "Username":user.uid.toString(),
      "section": section


    });



    User? usersin = await _auth.signInWithEmailAndPassword(email, password);


    // Navigator.pushReplacementNamed(context, Routes.newhome);


    if(usersin!= null) {
    print("User is successfully login");

    UserModel? userinfo = await _auth.getUserInfoByEmail(
        user?.email ?? '');

    // Store user information locally
    await  _auth.storeUserInfoLocally(
        user?.uid, user?.uid, user?.email,
        userinfo?.fullName,
        userinfo?.role

    );




    Navigator.pushReplacementNamed(context, Routes.newhome);

    }
    // Navigator.pushReplacementNamed(context, Routes.mainRoute);



    }else{
    _displayDialog('Registration failed. Please try again.');
    }



  }






}






