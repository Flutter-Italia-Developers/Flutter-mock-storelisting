// To parse this JSON data, do
//
//     final shopListing = shopListingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ListingModel> shopListingFromJson(String str) => List<ListingModel>.from(json.decode(str).map((x) => ListingModel.fromJson(x)));

class ListingModel {
  ListingModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final Rating rating;

  factory ListingModel.fromJson(Map<String, dynamic> json) => ListingModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

}
