
import 'package:fshop/models/category_model.dart';
import 'package:fshop/models/product_models.dart';

import '../utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServises{
  static Future<List> getCategories() async{
    var response =  await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    }else{
      return throw Exception("Faild To Load Products");
    }
  }
}

class CategoryProductServises{
  static Future<List<ProductModel>> getCategoryProduct(String category) async{
    var response =  await http.get(Uri.parse("$baseUrl/products/category/$category"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    }else{
      return throw Exception("Faild To Load Category Products");
    }
  }
}