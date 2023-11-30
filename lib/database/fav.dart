import 'package:foodoo/database/fav%20database.dart';

class favModel{
  int? id;
  late String name;
  late String url;

  favModel({this.id ,required this.name ,required this.url});

  favModel.fromMap(Map<String,dynamic> database){
    if(database[ColumnId] != null){
      this.id = database[ColumnId];
    }
    this.name = database[ColumnName];
    this.url = database[ColumnUrl];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> database = {};
    if(this.id != null){
      database[ColumnId] = this.id;
    }
    database[ColumnName] = this.name;
    database[ColumnUrl] = this.url;

    return database;
  }
}