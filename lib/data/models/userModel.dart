

class UserModel{


  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;
  final String role;
  final String username;
  final String serviceType;
  final String gender;
  final String birthday;
  final String section;
  final String Address;

  UserModel( {
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.username,
    required this.serviceType,
    required this.gender,
    required this.birthday,
    required this.section,
    required this.Address,






  });


  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      email: map['Email'],
      fullName:map['FullName'],
      password:map['Password'],
      phoneNumber:map['PhoneNumber'],
      role:map['Role'],
      username:map['Username'],
      serviceType: map['ServiceType'],
      gender: map['Gender'],
      birthday: map['BirthDay'],
      section: map['section'],
      Address: map['Address'],
    );
  }


}