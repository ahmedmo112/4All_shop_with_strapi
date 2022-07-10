import 'dart:convert';

import 'package:fshop/models/product_models.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices{
  static ProductModel? productModel;
  static Future<List<ProductData>?> getProducts() async{
    var response =  await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(json.decode(response.body));
      return productModel!.data;
    }else{
      return throw Exception("Faild To Load Products");
    }
  }

}