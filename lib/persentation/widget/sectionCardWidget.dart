import 'package:flutter/material.dart';

import '../../data/sections/sectionModel.dart';
import '../service_provider/proiverList_view.dart';





class SectionCardWidget extends StatelessWidget {
  const SectionCardWidget({super.key, required this.item});



  final SectionModel item;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){


        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => ProviderListView(servicetype: item.id,)));


      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            // Image at the top of the card, stretched to fill
            Image(
              image: NetworkImage(item.imageurl),
              width: double.infinity,
              height: 150.0,

              fit: BoxFit.cover,
              //  fit: BoxFit.cover,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                )







              ],
            )
            // Text at the bottom of the card, centered with shadow

          ],
        ),
      ),
    );
  }
}