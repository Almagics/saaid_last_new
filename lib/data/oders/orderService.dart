


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../firebase_auth/firebase_auth_service.dart';
import 'order_list_model.dart';

class OrderService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> NewOrder(



  String supject,
      Timestamp date,
  String status,
  String subtitle,
  String username,
  String id,
  String provider,
  String loaction,
      Timestamp time,
  String comment,
      double? rate,
      String price,





      ) async{
    final  store = FirebaseFirestore.instance;

    var newid = Uuid().v4();




    try{
      await store.collection("order")

          .add({

        "id":newid,
        "supject":supject,
        "date":date,

        "status":status,

        "subtitle":subtitle,
        "username":username,
        "provider":provider,
        "loaction":loaction,
        "time":time,
        "comment":comment,
        "rate":rate,
        "price":price



      });

      return true;

    }catch (e) {

      print('Error adding document: $e');
      return false;



    }







  }


  Future<List<OrderModel>> orderListData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuthService _auth = FirebaseAuthService();

    var email = await _auth.getEmail();
    var role = await _auth.getRole();

    print('rooole333: ${role}');

    print('emailll: ${email}');


    String? username;
    String? prodivdername;
if(role == "provider") {
  prodivdername = email;
}

    if(role == "user") {
      username = email;
    }






    if(username != null){

      QuerySnapshot querySnapshot = await _firestore
          .collection('order')
          .where('username', isEqualTo: username) // Filtering by main_group
          .get();

      return querySnapshot.docs.map((doc) => OrderModel(
        id: doc['id'],
        supject:doc['supject'],
        date:doc['date'],
        status:doc['status'],
        subtitle:doc['subtitle'],
        username:doc['username'],
        provider:doc['provider'],
        loaction:doc['loaction'],
        time:doc['time'],
        comment:doc['comment'],
        rate:doc['rate'],
        price:doc['price'],


        // Map other fields here
      )).toList();

    }else{

      QuerySnapshot querySnapshot = await _firestore
          .collection('order')
          .where('provider', isEqualTo: prodivdername) // Filtering by main_group
          .get();

      return querySnapshot.docs.map((doc) =>
          OrderModel(
            id: doc['id'],
            supject: doc['supject'],
            date: doc['date'],
            status: doc['status'],
            subtitle: doc['subtitle'],
            username: doc['username'],
            provider: doc['provider'],
            loaction: doc['loaction'],
            time:doc['time'],
            comment:doc['comment'],
            rate:doc['rate'],
            price:doc['price'],


            // Map other fields here
          )).toList();
    }



    }









  Future<void> deleteDocument(String documentId) async {
    final CollectionReference<Map<String, dynamic>> usersCollection =
    FirebaseFirestore.instance.collection('order');

    try {
      // Query for the document with the specific name
      QuerySnapshot querySnapshot = await usersCollection
          .where('id', isEqualTo: documentId)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isNotEmpty) {
        // Get the document ID
        String documentId = querySnapshot.docs.first.id;

        // Delete the document
        await usersCollection.doc(documentId).delete();
        print('Document with name "$documentId" deleted successfully!');
      } else {
        print('No document found with the name "$documentId".');
      }
    } catch (error) {
      print('Error deleting document: $error');
    }
  }









  Future<void> updateDocumentByid(String name, Map<String, dynamic> data) async {
    final CollectionReference<Map<String, dynamic>> usersCollection =
    FirebaseFirestore.instance.collection('order');

    try {
      // Query for the document with the specific name
      QuerySnapshot querySnapshot = await usersCollection
          .where('id', isEqualTo: name)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isNotEmpty) {
        // Get the document ID
        String documentId = querySnapshot.docs.first.id;

        // Update the document
        await usersCollection.doc(documentId).update(data);
        print('Document with name "$name" updated successfully!');
      } else {
        print('No document found with the name "$name".');
      }
    } catch (error) {
      print('Error updating document: $error');
    }
  }



  Future<Map<String, dynamic>> getOrdersData(String deliveryManId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('order')
        .where('provider', isEqualTo: deliveryManId)
        .get();

    int orderCount = querySnapshot.docs.length;
    double totalRating = 0;

    for (var doc in querySnapshot.docs) {
      totalRating += doc['rate'];
    }

    double averageRating = orderCount > 0 ? totalRating / orderCount : 0;

    return {
      'orderCount': orderCount,
      'averageRating': averageRating,
    };
  }

  Future<bool> sendEmail({
    required String toEmail,
    required String toName,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': 'service_sdz31jb',
        'template_id': 'template_elmm4r5',
        'user_id': 'BMtYu64VnZTLkYZep',
        'template_params': {
          'to_email': toEmail,
          'to_name': toName,
          'message': message,
        },
      }),
    );

    var responsrep = response.body.toString();

    print('ressssssponse body :${responsrep}');

    return response.statusCode == 200;
  }
}


