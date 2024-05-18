import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saaid/persentation/section/sectionListView.dart';

import '../../data/sections/sectionsService.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';




class SectionAddView extends StatefulWidget {
  const SectionAddView({super.key});

  @override
  State<SectionAddView> createState() => _SectionAddViewState();
}
final SectionService _db = SectionService();
final  _store = FirebaseFirestore.instance;



final nameController = TextEditingController();

final mainGroupController = TextEditingController();





String? _imageUrl;


_getDropDownDecoration({required hintText, required IconData icon}) {
  return InputDecoration(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      hintText: hintText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)));
}



final _formKey = GlobalKey<FormState>();

class _SectionAddViewState extends State<SectionAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.white,),
          onPressed: () {

            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: const Center(child: Text("New Section ", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),)),
      ),

      body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [














                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Section Name ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.account_tree,
                      controller: nameController,
                      hintText: 'Enter Section Name', inputFormatter: [],


                    )),


                SizedBox(height: 5,),


                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Required*';
                        }
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: _getDropDownDecoration(
                          hintText: 'Service Type', icon: Icons.home_repair_service),
                      items: ['Lawn and Garden Care', 'Electricity','Painting and Caulking','Plumbing']
                          .map((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e.toString(),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          mainGroupController.text = value!;
                        });
                      }),
                ),






                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    ' Photo',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),












                SizedBox(height: 5,),



                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        _imageUrl != null
                            ? Image.network(_imageUrl!)
                            : Text('No image selected.'),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              XFile? pickedImage = await _db.pickImage();
                              if (pickedImage != null) {
                                String? imageUrl = await _db.uploadImageToFirebase(pickedImage,"images/section/");
                                if (imageUrl != null) {
                                  setState(() {
                                    _imageUrl = imageUrl;
                                  });
                                }
                              }
                            },

                            child: Icon(Icons.add_photo_alternate,color: Colors.white,),
                          ),
                        ),
                      ],
                    )

                ),

















                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.fromLTRB(3,0,3,0),
                  child: Center(
                    child: SizedBox(width: 380,height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, Routes.payment);
                          _saveSection();
                        },


                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold

                          ),


                        ),

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5,),


              ],
            ),
          )
      ),
    );
  }


  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save  Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }





  void _saveSection() async{





    String name = nameController.text;
    String maingroup = mainGroupController.text;
    String img = _imageUrl.toString();
bool resultsave = await _db.NewSection(maingroup, name, img);

if(resultsave){

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (ctx) => SectionListView(mainGroup: maingroup)));
}else{

  _displayDialog('Failed to add data');
}

  }

}