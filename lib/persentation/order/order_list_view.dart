import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saaid/data/oders/orderService.dart';
import 'package:saaid/data/oders/order_list_model.dart';

import '../resources/color_manager.dart';

import '../resources/routes_manager.dart';
import '../widget/orderCardwidget.dart';


class OrderViewList extends StatefulWidget {
  const OrderViewList({super.key,  this.username,  this.provider});
final String? username;
  final String? provider;


  @override
  State<OrderViewList> createState() => _OrderViewListState();
}

class _OrderViewListState extends State<OrderViewList> {

final OrderService _db = OrderService();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  floatingActionButton: FloatingActionButton(
      //  onPressed: () {
       //   Navigator.pushReplacementNamed(context, Routes.ordernew);
      //  },


      //  child: Icon(Icons.add),
       // backgroundColor: ColorManager.primary,
     // ),


      body: FutureBuilder<List<OrderModel>>(
        future:  _db.orderListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final data = snapshot.data;

            print("dataaa is : $data" );

            // Display data in a ListView or other widget
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return OrderCardWidget(item: data![index],);
              },

            );
          } else {
            return const Center(child: Text('No data found for'));
          }
        },
      ),

    );
  }

}




