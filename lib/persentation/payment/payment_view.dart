import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../widget/app_text_form_filed.dart';



class PaymentView extends StatefulWidget {
  const PaymentView({super.key, required this.price, this.username});
  final String? price;
  final String? username;
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {



  final holdername = TextEditingController();
  final cardnumber = TextEditingController();
  final cvv = TextEditingController();
  final exp = TextEditingController();


  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    holdername.dispose();
    cardnumber.dispose();
    cvv.dispose();
    exp.dispose();

    super.dispose();
  }










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
        title: Center(child: Text("Pay",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SafeArea(child: SizedBox.shrink()),

              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextFormFiled(
                            iconData: Icons.calculate_outlined,
                            controller: holdername,
                            hintText: "Card holder Name", inputFormatter: null,
                            // keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            iconData: Icons.numbers,
                            controller: cardnumber,
                            hintText: "Card Number",
                            keyboardType: TextInputType.number,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the card number';
                              }
                              // Add more card number validation as needed (e.g., length, Luhn algorithm)
                              return null;
                            }, inputFormatter: null,

                          ),



                          const SizedBox(
                            height: 20.0,
                          ),


                          AppTextFormFiled(
                            iconData: Icons.date_range,
                            controller: exp,
                            hintText: "Expiration date",
                            // keyboardType: TextInputType.number,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the expiration date';
                              }
                              if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                                return 'Invalid format (MM/YY)';
                              }
                              // You can add more date validation here
                              return null;
                            },inputFormatter: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}')),
                          ],

                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          AppTextFormFiled(
                            iconData: Icons.credit_card_rounded,
                            controller: cvv,
                            hintText: "CVV",
                            keyboardType: TextInputType.number,

                            validator: (value) {

                              // You can add more date validation here
                              return null;
                            },
                            inputFormatter: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}')),
                            ],

                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          Container(
                            padding: const EdgeInsets.fromLTRB(3,0,3,0),
                            child: Center(
                              child: SizedBox(width: 380,height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, Routes.paymentdone);
                                    // _signin();
                                  },


                                  style: Theme.of(context).elevatedButtonTheme.style,
                                  child: const Text('Pay',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold

                                    ),


                                  ),

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}