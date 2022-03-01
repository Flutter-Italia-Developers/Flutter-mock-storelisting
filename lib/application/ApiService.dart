import 'dart:convert';

import 'package:my_shop_app/data/listing_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ListingModel>> getListings() async {
    const productUrl = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(productUrl));
    return List<ListingModel>.from(
      jsonDecode(response.body).map(
        (x) => ListingModel.fromJson(x),
      ),
    );
  }
}
