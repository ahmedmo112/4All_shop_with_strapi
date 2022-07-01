import 'package:fshop/models/product_models.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices{

  static Future<List<ProductModel>> getProducts() async{
    var response =  await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    }else{
      return throw Exception("Faild To Load Products");
    }
  }

}