import 'dart:convert';

import '../util/http_requests.dart';

class Client{
  static const String CLIENT_ENDPOINT = "/client";

  final int id;
  final String name;
  final String phoneNumber;
  final String address;
  final String photoUrl;

  Client({this.id, this.name, this.phoneNumber, this.address, this.photoUrl});

  factory Client.fromMap(dynamic obj){
    return Client(
      id: obj['id'],
      name: obj['name'],
      phoneNumber: obj['phone_number'],
      address: obj['address'],
      photoUrl: obj['photo_url']
    );
  }

  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      address: json['address'] ?? '',
      photoUrl: json['photo_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['photo_url'] = photoUrl;

    return map;
  }

  static Resource<List<Client>> get list{
    return Resource(
      url: Resource.REQUESTS_URL + Client.CLIENT_ENDPOINT,
      parse: (response){
        final decodedData = utf8.decode(response.bodyBytes);
        final result = jsonDecode(decodedData);
        Iterable list = result;

        return list.map((model) => Client.fromJson(model)).toList();
      }
    );
  }

}