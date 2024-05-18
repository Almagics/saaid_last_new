


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saaid/data/models/userModel.dart';
import 'package:saaid/data/service_provider/providerService.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../data/oders/orderService.dart';
import '../order/order_new_view.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class ProviderListView extends StatefulWidget {
  const ProviderListView({super.key, required this.servicetype});


  final String servicetype;


  @override
  State<ProviderListView> createState() => _ProviderListViewState();
}

class _ProviderListViewState extends State<ProviderListView> {

  TextEditingController _searchController = TextEditingController();



  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }




  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }




  final ProviderService providerService = ProviderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkGrey,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text('Provider List',style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Column(
        children: [


          Container(
            margin:  EdgeInsets.all(3),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search something...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // I Navigator.pushReplacementNamed(context, Routes.newhome);mplement search functionality here
              },
            ),
          ),




          StreamBuilder<List<UserModel>>(
            stream: providerService.getProviders(widget.servicetype),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {

                print("type: ${widget.servicetype}");
                // While data is being fetched
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If an error occurs
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                // If no data is available
                return Center(child: Text('No Provider available'));
              } else {

                List<UserModel> filteredProviders = snapshot.data!.where((provider) {
                  return provider.fullName.toLowerCase().contains(_searchQuery.toLowerCase());
                }).toList();

                if (filteredProviders.isEmpty) {
                  return Center(child: Text('No Provider found'));
                }

                // If data is available, display the list of doctors
                return  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: .75),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,



                  itemCount: filteredProviders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => OrderNewView(providerid:  filteredProviders[index].email,)));

                        },

                        child: CardWithImageAndText(item: snapshot.data![index]));
                  },
                );
              }
            },
          ),











        ],
      ),
    );
  }
}


class CardWithImageAndText extends StatelessWidget {
  final UserModel item;
  final OrderService _order = OrderService();
  CardWithImageAndText({required this.item});

  void openWhatsAppChat(String phoneNumber) async {
    var contact = "+201126331854";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    // var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";



    await launchUrl(Uri.parse(androidUrl));


  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          // Image at the top of the card, stretched to fill
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image(
              image: AssetImage(ImageAssets.userlogo),
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.25,
              height: 50.0,
            //  fit: BoxFit.cover,
            ),
          ),
          SizedBox(height:5.0),

          Column(

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                FutureBuilder<Map<String, dynamic>>(
              future: _order.getOrdersData(item.email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  int orderCount = data['orderCount'];
                  double averageRating = data['averageRating'];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Orders: $orderCount'),
                      Text('Average Rating: ${averageRating.toStringAsFixed(1)}'),
                      RatingBarIndicator(
                        rating: averageRating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        itemCount: 5,
                        itemSize: 10,
                        direction: Axis.horizontal,
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('No data found'));
                }
              },
              ),

                ],

              ),

              Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    item.fullName,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: GestureDetector(
                      onTap: (){

                        openWhatsAppChat(item.phoneNumber?? '');
                      },

                      child: Icon(Icons.message,size: 20, color: Colors.blue,)),
                ),
              ),


            ],
          )
          // Text at the bottom of the card, centered with shadow

        ],
      ),
    );
  }
}
