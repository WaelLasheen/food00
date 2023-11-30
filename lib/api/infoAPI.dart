import 'dart:convert';
import 'package:http/http.dart'  as http;
import '../model/info.dart';


class infoAPI{
  Future<infoModel> fetchData(int id) async{
    String url = 'https://api.spoonacular.com/recipes/$id/information?apiKey=3c9324eca1774d7f98d276e249d106a3';
    final respond = await http.get(Uri.parse(url));
    
    if(respond.statusCode == 200){
      var data = jsonDecode(respond.body);
      infoModel myData = infoModel.fromJson(data);
      return myData;
      }
      else{
        throw Exception('${respond.statusCode}');
      }
    }
  }
