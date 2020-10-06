import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T>{
  static const String REQUESTS_URL = "https://private-59df5-client20.apiary-mock.com";

  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class RequestsHelper {

  Future<T> load<T>(Resource<T> resource) async{
    final response = await http.get(resource.url);
    if(response.statusCode == 200){
      return resource.parse(response);

    }else{

      throw Exception('Could not load data');
    }
  }
}
