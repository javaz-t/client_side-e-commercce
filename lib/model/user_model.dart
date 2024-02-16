


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
