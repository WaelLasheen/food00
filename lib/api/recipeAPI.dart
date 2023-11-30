import 'dart:convert';
import 'package:foodoo/model/recipe.dart';
import 'package:http/http.dart'  as http;


class RecipeAPI{
  String url = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=3c9324eca1774d7f98d276e249d106a3';
  Future<recipeModel> fetchData() async{

    final respond = await http.get(Uri.parse(url));
    
    if(respond.statusCode == 200){
      var data = jsonDecode(respond.body);
      recipeModel myRecipe = recipeModel.fromJson(data);
      return myRecipe;
      }
      else{
        throw Exception('${respond.statusCode}');
      }
    }
  }
