import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel{



  final String supject;
  final Timestamp date;
  final String status;
  final String subtitle;
  final String username;
  final String id;
  final String provider;
  final String loaction;
  final String price;

  final Timestamp time;
  final String comment;
  final double? rate;


  OrderModel( {required this.supject,
    required this.date,
    required this.status,
    required this.subtitle,
    required this.username,
    required this.id,
    required this.provider,
    required this.loaction,
    required this.time,
    required this.comment,
     this.rate,
    required this.price



  });


  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      supject:map['supject'],
      date:map['date'],
      status:map['status'],
      subtitle:map['subtitle'],
      username:map['username'],
      provider:map['provider'],
      loaction:map['loaction'],
      time:map['time'],
      comment:map['comment'],
      rate:map['rate'],
      price: map['price']



    );
  }


}