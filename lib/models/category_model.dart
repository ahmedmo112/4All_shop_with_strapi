import 'dart:convert';

List<String> categoryModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));
