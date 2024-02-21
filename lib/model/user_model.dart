


import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String number;
  final String name;


  User ({
    required this.id,
    required this.name,
    required this.number,
  });

  // Convert a Product to JSON
  Map<String, dynamic> toJson() => {

    'name': name,
    'number': number,
    'id':id

  };

  // Create a Product from JSON
  factory User.fromJson(Map<String, dynamic> json) => User(

    name: json['name'],
    number: json['number'],
    id:json['id'],
  );
}

/// for submit demo
class SubmitUser {
  final String number;
  final String name;


  SubmitUser ({
    required this.name,
    required this.number,
  });

  // Convert a Product to JSON
  Map<String, dynamic> toJson() => {

    'productNam': name,
    'price': number,

  };

  // Create a Product from JSON
  factory SubmitUser.fromJson(Map<String, dynamic> json) => SubmitUser(

    name: json['productNam'],
    number: json['price'],

  );
}

