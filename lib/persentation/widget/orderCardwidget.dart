import 'package:flutter/material.dart';

import '../../data/oders/order_list_model.dart';
import '../order/orderInfoView.dart';
import '../resources/color_manager.dart';


class OrderCardWidget extends StatelessWidget {

  
  final OrderModel item;

  const OrderCardWidget({super.key,  required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => OrderShow(item: item,)));
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          color: ColorManager.primary,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image at the top of the card, stretched to fill


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(

                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Center(
                        child: Text('${item!.supject.toString()} | ${item!.status.toString()}',

                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,

                          ),


                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('Date: ${item!.date.toDate().toLocal()}')),





                      ],
                    ),
                  )


                ],
              ),


              Column(
                children: [

                  Icon(Icons.add_chart_sharp)
                ],
              ),
              // Text at the bottom of the card, centered with shadow

            ],
          ),
        ),
      ),
    );
  }
}