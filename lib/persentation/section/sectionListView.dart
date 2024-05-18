import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saaid/persentation/section/sectionAddView.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../../data/sections/sectionModel.dart';
import '../../data/sections/sectionsService.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../widget/sectionCardWidget.dart';






class SectionListView extends StatefulWidget {
  const SectionListView({super.key, required this.mainGroup});

  final String mainGroup;

  @override
  State<SectionListView> createState() => _SectionListViewState();
}









class _SectionListViewState extends State<SectionListView> {
  final SectionService _db = SectionService();

  final FirebaseAuthService _auth = FirebaseAuthService();

  String? _userRole;


  TextEditingController _searchController = TextEditingController();



  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadUserRole();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }













  Future<void> _loadUserRole() async {
    String? role = await _auth.getRole();
    setState(() {
      _userRole = role;
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton:_userRole == 'admin' ? FloatingActionButton(
        onPressed: () {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (ctx) => SectionAddView()));
        },


        child: Icon(Icons.add),
        backgroundColor: ColorManager.primary,
      ):null,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text("Sections List",style: Theme.of(context).textTheme.titleLarge,)),
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



          FutureBuilder<List<SectionModel>>(
            future: _db.SectionListData(widget.mainGroup),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final data = snapshot.data;

                List<SectionModel> filteredProviders = snapshot.data!.where((provider) {
                  return provider.name.toLowerCase().contains(_searchQuery.toLowerCase());
                }).toList();


                // Display data in a ListView or other widget
                return  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: .75),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,



                  itemCount: filteredProviders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (){
                          //  Navigator.pushReplacementNamed(context, Routes.ordernew);

                        },

                        child: SectionCardWidget(item: filteredProviders![index]));
                  },
                );
              } else {
                return Center(child: Text('No data found for'));
              }
            },
          ),
        ],
      ),

    );


  }













}