import 'package:flutter/material.dart';
import 'package:saaid/persentation/resources/color_manager.dart';



class RoundedCardOptions extends StatelessWidget {
  final String title;

  final IconData geticon;

  const RoundedCardOptions({

    required this.title,

    required this.geticon,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width * .4,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            SizedBox(height: 20),
            ClipRRect(

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Icon(geticon,size: 50, color: ColorManager.primary,),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )


          ],
        ),
      ),
    );
  }
}