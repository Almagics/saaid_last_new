import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../options/options_view.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class HelpView extends StatelessWidget {
  const HelpView({super.key});

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
          Text('Welcome to SAAID!',
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
                title: const Text("Account Navigation:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Dashboard: Access your dashboard by tapping on the home icon in the bottom navigation bar. Here, you can view various sections of repair services.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),

              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Services",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Browse available services by tapping on the wanted "Section". Use the search bar to find specific services.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),

              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Orders",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Track your orders by tapping on the "Orders" tab. You can see order states (Completed, Active) and communicate with service providers here.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),


              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Account Settings: ",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Customize your profile and preferences by tapping on your profile picture in the bottom right corner. From here, you can edit your profile details, change account settings, and manage notifications.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),


              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Feature Overview:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Chatpot: Instantly search for a solution to your problem using the Chatpot feature. Tap on the chat icon next to the user is profile to start a chat.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),


              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Customer Service:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  ' Have questions or concerns? Our support team is available 24/7 to assist you. Tap on the customer service icon inside the settings page to find assistance.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),



              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Evaluate Service Providers: ",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  ' After completing an order, do not forget to rate and review the service provider. Your feedback helps maintain service quality for all users.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),




              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Troubleshooting:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Connectivity Issues: If you are experiencing connectivity problems, try switching between Wi-Fi and mobile data or restarting your device.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),


              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Password Reset: ",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Forgot your password? Tap on the "Forgot Password" link on the login screen to reset it.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),


              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Location Authorization:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  ' Ensure that SAAID has permission to access your device is location to provide accurate service recommendations.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),




              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("FAQs:",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Q: How do I update my profile picture? A: Navigate to the "Account page" and tap on your profile picture to upload a new image.',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),




              ListTile(
                leading:
                Icon(Icons.arrow_forward, color: ColorManager.primary),
                title: const Text("Q: Can I cancel an order after it's been placed?",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                subtitle:  Text(  'Yes, you can cancel or reschedule an order from the "Orders" tab as long as it has not been completed yet',
                    style:
                    TextStyle(fontSize: 15, color: Colors.black54)),
              ),
              Divider(),

































            ],
          ),

        ));
  }
}
