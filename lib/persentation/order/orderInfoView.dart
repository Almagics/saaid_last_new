

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saaid/data/oders/order_list_model.dart';


import '../../data/firebase_auth/firebase_auth_service.dart';
import '../../data/oders/orderService.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';

import 'package:intl/intl.dart';

class OrderShow extends StatefulWidget {
  const OrderShow({super.key, required this.item});

 final OrderModel item;




  @override
  State<OrderShow> createState() => _OrderShowState();
}

class _OrderShowState extends State<OrderShow> {



  final FirebaseAuthService _auth = FirebaseAuthService();
  final OrderService appservice = OrderService();

  final  _store = FirebaseFirestore.instance;


  final feebackController = TextEditingController();

  final rateingcontroller = TextEditingController();

  double? rating;












  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.newhome);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkGrey,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child:
        Text('Show Order',
            style: Theme.of(context).textTheme.displayLarge

        )
        ),
      ),

      body: SingleChildScrollView(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            ListTile(
              leading:
              Icon(Icons.email, color: ColorManager.primary),
              title: const Text("Order Supject",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(  widget.item.supject,
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),

            ListTile(
              leading:
              Icon(Icons.date_range_sharp, color: ColorManager.primary),
              title: const Text("Date",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(   DateFormat('DD-mm-yyyy').format( widget.item.date.toDate()),
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),







            ListTile(
              leading:
              Icon(Icons.timelapse, color: ColorManager.primary),
              title: const Text("Time",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(   DateFormat('HH:mm').format(widget.item.date.toDate()),
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),



            ListTile(
              leading:
              Icon(Icons.receipt, color: ColorManager.primary),
              title: const Text("Order Description",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(   widget.item.subtitle,
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),


            ListTile(
              leading:
              Icon(Icons.stacked_bar_chart, color: ColorManager.primary),
              title: const Text("Status",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(   widget.item.status,
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),

            ListTile(
              leading:
              Icon(Icons.star, color: ColorManager.primary),
              title: const Text("Rating",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  RatingBarIndicator(
                rating: widget.item.rate!,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                itemCount: 5,
                itemSize: 50.0,
                direction: Axis.horizontal,
              ),
            ),
            Divider(),


            ListTile(
              leading:
              Icon(Icons.comment, color: ColorManager.primary),
              title: const Text("Feedback",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              subtitle:  Text(   widget.item.comment,
                  style:
                  TextStyle(fontSize: 15, color: Colors.black54)),
            ),
            Divider(),























            const SizedBox(height: 20,),




            FutureBuilder<String?>(
                future: _auth.getRole(),
                builder: (context, snapshot2) {
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    // If the Future is still in progress, show a loading indicator
                    return const CircularProgressIndicator();
                  } else if (snapshot2.hasError) {
                    // If there's an error, display an error message
                    return Text('Error: ${snapshot2.error}');
                  } else {

                    print('statussssssss: ${widget.item.status}');

                    print('rooole: ${snapshot2.data}');

                    // If the Future is complete, use the value to conditionally show the button
                    if(snapshot2.data == "provider"){



                      ///
                      ///

                      if(widget.item.status == "Approved"){

                        return Column(
                          children: [


                            Container(
                              padding: const EdgeInsets.fromLTRB(3,0,3,0),
                              child: Center(
                                child: SizedBox(width: 380,height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await appservice.updateDocumentByid(widget.item.id, {'status': 'Done'});
                                      // Navigator.pushReplacementNamed(context, Routes.appconifrm);
                                      setState(() {});
                                    },


                                    style: Theme.of(context).elevatedButtonTheme.style,
                                    child: const Text('Done'),

                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),






                            const SizedBox(height: 10,),



                            Container(
                              padding: const EdgeInsets.fromLTRB(3,0,3,0),
                              child: Center(
                                child: SizedBox(width: 380,height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      appservice.deleteDocument(widget.item.id);

                                      //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                                      //   Navigator.pushReplacementNamed(context, Routes.homedoctor);
                                      setState(() {});
                                    },


                                    style: Theme.of(context).elevatedButtonTheme.style,
                                    child: const Text('Cancel'),

                                  ),
                                ),
                              ),
                            ),

                          ],
                        );

                      }else{
                        if(widget.item.status == "Reviewing"){

                          return Column(
                            children: [

                              Container(
                                padding: const EdgeInsets.fromLTRB(3,0,3,0),
                                child: Center(
                                  child: SizedBox(width: 380,height: 50,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await appservice.updateDocumentByid(widget.item.id, {'status': 'Approved'});
                                        // Navigator.pushReplacementNamed(context, Routes.appconifrm);
                                        setState(() {});
                                      },


                                      style: Theme.of(context).elevatedButtonTheme.style,
                                      child: const Text('Approve'),

                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),



                              const SizedBox(height: 10,),



                              Container(
                                padding: const EdgeInsets.fromLTRB(3,0,3,0),
                                child: Center(
                                  child: SizedBox(width: 380,height: 50,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        appservice.deleteDocument(widget.item.id);

                                        //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                                        //   Navigator.pushReplacementNamed(context, Routes.homedoctor);
                                        setState(() {});
                                      },


                                      style: Theme.of(context).elevatedButtonTheme.style,
                                      child: const Text('Cancel'),

                                    ),
                                  ),
                                ),
                              ),

                            ],
                          );

                        }else{
                          return const SizedBox(height: 1,);
                        }
                      }


                      ///










                    }else{

                    if(snapshot2.data == "user"){

                      if(widget.item.status == "Done"){

                        return Column(
                          children: [


                            SizedBox(height: 5,),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Feedback',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium,
                              ),
                            ),

                            Container(padding: const EdgeInsets.all(AppPadding.p8),
                                child: AppTextFormFiled(
                                  iconData: Icons.list_alt_sharp,
                                  controller: feebackController,
                                  hintText: 'Enter your feedback',
                                  minLine: 5,
                                  inputFormatter: null,
                                  maxLine: 8,

                                )),

                            const SizedBox(height: 10,),

                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Rating',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium,
                              ),
                            ),


                            SizedBox(height: 16),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              onRatingUpdate: (rating) {
                                rateingcontroller.text = rating.toString();
                              },
                            ),


                            SizedBox(height: 16),


                            Container(
                              padding: const EdgeInsets.fromLTRB(3,0,3,0),
                              child: Center(
                                child: SizedBox(width: 380,height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      double rating = double.parse(rateingcontroller.text) ;
                                      await appservice.updateDocumentByid(widget.item.id, {'comment': feebackController.text,'rate':rating,'status': 'Finished' });
                                      // Navigator.pushReplacementNamed(context, Routes.appconifrm);
                                      setState(() {});
                                    },


                                    style: Theme.of(context).elevatedButtonTheme.style,
                                    child: const Text('Send'),

                                  ),
                                ),
                              ),
                            ),


                            SizedBox(height: 16),






                          ],
                        );

                      }


                    }




                      return  const SizedBox(height: 1,);
                    }
                  }
                }

            ),








            const SizedBox(height: 20,),

          ],
        ),

      ));








  }
}