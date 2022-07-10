
import 'dart:convert';

import 'package:fshop/models/category_model.dart';
import 'package:fshop/models/product_models.dart';

import '../utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServises{
  static CategoryModel? categoryModel;
  static Future<List<CategoryData>> getCategories() async{
    var response =  await http.get(Uri.parse("$baseUrl/category"));
    if (response.statusCode == 200) {
      categoryModel =  CategoryModel.fromJson(json.decode(response.body));
      return categoryModel!.data!;
    }else{
      return throw Exception("Faild To Load Products");
    }
  }
}

class CategoryProductServises{
  static CategoryModel? categoryModel;
  static Future<List<ProductData>> getCategoryProduct(String category) async{
    var response =  await http.get(Uri.parse("$baseUrl/category?filters[name][\$eq]=$category&populate=products"));
    if (response.statusCode == 200) {
       categoryModel =  CategoryModel.fromJson(json.decode(response.body));
      return categoryModel!.data![0].attributes!.products!.data!;
    }else{
      return throw Exception("Faild To Load Category Products");
    }
  }
}