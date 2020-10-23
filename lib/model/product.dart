import 'dart:convert';

import 'package:invoice_app/util/http_requests.dart';

class Product{
  static const String PRODUCT_ENDPOINT = "/product";

  final String code;
  final String name;
  final String description;
  final num price;
  final String photoUrl;

  Product({this.code, this.name, this.description, this.price, this.photoUrl});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      photoUrl: json['photo_url'] ?? '',
    );
  }

  static Resource<List<Product>> get list{
    return Resource(
        url: "http://private-1cd9c0-tests68.apiary-mock.com" + Product.PRODUCT_ENDPOINT,
        parse: (response){
          final decodedData = utf8.decode(response.bodyBytes);
          final result = jsonDecode(decodedData);
          Iterable list = result;

          return list.map((model) => Product.fromJson(model)).toList();
        }
    );
  }

}
