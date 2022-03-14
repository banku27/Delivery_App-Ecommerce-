import 'dart:convert';

import 'package:ecommerce/models/recommended_products_models.dart';
import 'package:http/http.dart' as http;

class ApiReq2 {
  final url = Uri.parse('https://mvs.bslmeiyu.com/api/v1/products/recommended');

  Future<ProductModel2?> getRecommended() async {
    try {
      final response = await http.get(url);
      print('got productss');
      if (response.statusCode == 200) {
        print(response.body);
        return ProductModel2.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }
}
