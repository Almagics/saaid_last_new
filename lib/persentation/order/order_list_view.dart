import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saaid/data/oders/order_list_model.dart';

import '../resources/color_manager.dart';

import '../resources/routes_manager.dart';
import '../widget/card_list_widget.dart';


class OrderViewList extends StatefulWidget {
  const OrderViewList({super.key});



  @override
  State<OrderViewList> createState() => _OrderViewListState();
}

class _OrderViewListState extends State<OrderViewList> {





Future<List<OrderModel>>   GetOrder() async
{

  final List<OrderModel> items = [

    OrderModel(supject: 'new order', date: '1-4-2024', status: 'pendding', subtitle: 'test order', username: 'ahmed', orderNo: 1),
    OrderModel(supject: 'new order', date: '1-4-2024', status: 'pendding', subtitle: 'test order', username: 'ahmed', orderNo: 2),
    OrderModel(supject: 'new order', date: '1-4-2024', status: 'pendding', subtitle: 'test order', username: 'ahmed', orderNo: 3),
    OrderModel(supject: 'new order', date: '1-4-2024', status: 'pendding', subtitle: 'test order', username: 'ahmed', orderNo: 4),



  ];

  return items;

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.ordernew);
        },


        child: Icon(Icons.add),
        backgroundColor: ColorManager.primary,
      ),


      body: FutureBuilder<List<OrderModel>>(
        future:  GetOrder(),
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
                return CardWithImageAndText(
                  onPressed: () {

                  },
                  name: data![index].supject ?? '',
                  id: data![index].orderNo ?? 0,
                  iconlist:   Icon(Icons.inventory_2_outlined,size: 50,color: Colors.white,),
                  desc:data![index].subtitle ?? '' ,
                  price: data![index].username ?? '',


                );
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




