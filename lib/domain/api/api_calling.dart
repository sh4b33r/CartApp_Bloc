import 'dart:convert';
import 'package:bloc_rest/domain/model/product_model.dart';

import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchfromApi() async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
  if (response.statusCode == 200) {
    final val = jsonDecode(response.body);
    List<dynamic> products = val;
    return products.map((json) => ProductModel.fromMap(json)).toList();
  } else {
    throw Exception("Something Went Wrong >>${response.statusCode}");
  }
}

// "email": "eve.holt@reqres.in",
//   "password": "cityslicka"

Future<bool> checkLogin(String username, String password) async {
  
  final response = await http.post(Uri.parse('https://reqres.in/api/login'),
      body: {"email": username, "password": password});
  
  return response.statusCode == 200 ? true : false;
}
