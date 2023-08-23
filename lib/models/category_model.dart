// To parse this JSON data, do
//
//     final categortModel = categortModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategortModel categortModelFromJson(String str) =>
    CategortModel.fromJson(json.decode(str));

String categortModelToJson(CategortModel data) => json.encode(data.toJson());

class CategortModel {
  List<Category> categories;

  CategortModel({
    required this.categories,
  });

  factory CategortModel.fromJson(Map<String, dynamic> json) => CategortModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String name;
  List<String> subcategory;

  Category({
    required this.name,
    required this.subcategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subcategory: List<String>.from(json["subcategories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subcategories": List<dynamic>.from(subcategory.map((x) => x)),
      };
}
