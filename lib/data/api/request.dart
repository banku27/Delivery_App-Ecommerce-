import 'dart:convert';

import 'package:ecommerce/models/popular_products_models.dart';
import 'package:http/http.dart' as http;

class ApiReq {
  final url = Uri.parse('https://mvs.bslmeiyu.com/api/v1/products/popular');

  Future<ProductModel?> getProducts() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        return ProductModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }
}
