


class SectionModel{


  final String id;
  final String main_group;
  final String name;
  final String imageurl;









  SectionModel( {
    required this.id,
    required this.main_group,
    required this.name,
    required this.imageurl,






  });


  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'],
      main_group:map['main_group'],
      name:map['name'],
      imageurl:map['imageurl'],



    );
  }




}