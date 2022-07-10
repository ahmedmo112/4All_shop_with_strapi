

import 'package:fshop/models/product_models.dart';
class CategoryModel {
  List<CategoryData>? data;
  Meta? meta;

  CategoryModel({this.data, this.meta});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add( CategoryData.fromJson(v));
      });
    }
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  Attributes? attributes;

  CategoryData({this.id, this.attributes});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ?  Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;

  ProductModel? products;


  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    products = json['products'] != null
        ?  ProductModel.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}
