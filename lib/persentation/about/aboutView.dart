import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../options/options_view.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => OptoinsView()));
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.darkGrey,
              statusBarBrightness: Brightness.light
          ),

          elevation: 0.0,
          title: Center(child:
          Text('About',
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
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("About SAAID",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'SAAID is a versatile application designed to streamline workforce connections, bringing together a diverse range of skilled professionals in one convenient platform. Whether you are seeking home repairs or corporate services, SAAID effortlessly connects service seekers with qualified providers, offering solutions for various needs such as carpentry, ',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),

              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'plumbing, electrical work, and more. Beyond being a convenient solution for those in need, SAAID also serves as an additional income source for skilled workers, providing them with opportunities to showcase their expertise. To further enhance customer satisfaction, the application features a responsive chatbot, ensuring that users receive immediate assistance while awaiting the arrival of the designated worker. SAAID revolutionizes the way individuals access and engage with essential services, promoting efficiency, reliability, and overall satisfaction for both service seekers and providers',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),































            ],
          ),

        ));
  }
}
