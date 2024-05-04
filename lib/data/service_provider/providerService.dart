import 'package:cloud_firestore/cloud_firestore.dart';


import '../models/userModel.dart';

class ProviderService {

  Stream<List<UserModel>> getProviders(String type) {

    print("tyyyyyyyyyyp: $type");

    try {
      // Assuming your collection is named 'users' and has a 'role' field
      return FirebaseFirestore.instance
          .collection('Users')
          .where('Role', isEqualTo: 'provider')
          .where('ServiceType', isEqualTo: type)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        return querySnapshot.docs.map((doc) => UserModel.fromMap(doc.data()))
            .toList();
      });
    } catch (e) {
      print("Error: $e");
      // Handle error
      return Stream.value([]); // Return an empty list in case of an error
    }
  }

}