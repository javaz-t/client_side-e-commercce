


import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String? id;
  final String? name;


  CategoryModel ({
    required this.id,
    required this.name,
  });

  // Convert a Product to JSON
  Map<String, dynamic> toJson() => {

    'name': name,
    'id':id

  };

  // Create a Product from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(

    name: json['name'],
    id:json['id'],
  );
}
