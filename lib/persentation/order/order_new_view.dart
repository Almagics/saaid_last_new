

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saaid/persentation/order/order_list_view.dart';
import 'package:uuid/uuid.dart';


import '../../data/firebase_auth/firebase_auth_service.dart';
import '../../data/oders/orderService.dart';
import '../resources/assets_manager.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';


class OrderNewView extends StatefulWidget {
  const OrderNewView({Key? key, required this.providerid}) : super(key: key);

  final String providerid;


  @override
  State<OrderNewView> createState() => _OrderNewViewState();
}

class _OrderNewViewState extends State<OrderNewView> {

  final OrderService _db = OrderService();

  final FirebaseAuthService _auth = FirebaseAuthService();
  // final  _store = FirebaseFirestore.instance;


  final supjectController = TextEditingController();
  final infoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final DateorderController = TextEditingController();

  late GoogleMapController _mapController;
  LatLng _selectedLocation = LatLng(0, 0);


  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.white,),
          onPressed: () {
            Navigator.pushReplacementNamed(context,
                Routes.newhome); // Navigate back to the previous screen
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

      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(padding: const EdgeInsets.all(4.0),
                  child: const Center(child: Image(
                    image: AssetImage(ImageAssets.logo),
                    height: 150,
                    width: 150,)),


                ),


                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Supject',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: supjectController,
                      hintText: 'Enter supject of your order',
                      inputFormatter: null,


                    )),


                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Order Details',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.list_alt_sharp,
                      controller: infoController,
                      hintText: 'Enter Order Details',
                      minLine: 5,
                      inputFormatter: null,
                      maxLine: 8,

                    )),


                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Date Of Order',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ),

                Center(
                  child: Text(
                    "Selected date: ${selectedDate != null
                        ? selectedDate!.toLocal().toString().split(' ')[0]
                        : 'No date selected'}",
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "Selected time: ${selectedTime != null ? selectedTime!.format(
                        context) : 'No time selected'}",
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select time'),
                  ),
                ),







                const Center(child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(image: AssetImage(ImageAssets.locat,),))),









                Row(


                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Select Your Location',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.all(4),
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: () {
                          // Handle location action
                        },
                      ),
                    ),
                  ],

                ),


                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: Center(
                    child: SizedBox(width: 380, height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveOrder();
                        },


                        style: Theme
                            .of(context)
                            .elevatedButtonTheme
                            .style,
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

                SizedBox(height: 16),
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


  void _saveOrder() async {
    String id = Uuid().v4();
    ;



    var username = await _auth.getEmail();


    String supject = supjectController.text;

    String? subtitle = infoController.text;
    DateTime? date = selectedDate!;

    String provider = widget.providerid;
    String location = '';


Timestamp? getdatetime ;

    DateTime combinedDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
    if(combinedDateTime != null){

      getdatetime =   Timestamp.fromDate(combinedDateTime);
    }


    bool result = await _db.NewOrder(
        supject,
        getdatetime!,
        "Reviewing",
        subtitle,
        username!,
        id,
        provider,
        location,
        getdatetime!,
        '',
        0,
      '50'
    );


    if (result) {
      print("data saved successfully ");

    var name = await  _auth.getName();
      var email = await  _auth.getEmail();



   var sendmail =   await   _db.sendEmail(toEmail: email!, toName: name!, message: 'THanks Fro Ordring SAAID Services');


     print('resssponse mail  ::: ${sendmail}');









      Navigator.pushReplacementNamed(context, Routes.payment);
    } else {
      _displayDialog('Failed to add data');
    }
  }
}

