import 'package:foodoo/database/fav.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String ColumnId = 'id';
final String ColumnName = 'name';
final String ColumnUrl = 'url';
final String tabelName = 'fav_tabel';

class favDatabase{
  late Database db;
  static final favDatabase instance = favDatabase._internal();

  factory favDatabase(){
    return instance;
  }
  favDatabase._internal();

  Future open() async{
    // var path = join( await getDatabasesPath() , 'fav.db');
    db = await openDatabase(
      join(await getDatabasesPath() , 'fav.db'),
      version: 2,
      onCreate: (Database db,int version) async{
        await db.execute('''
          create table $tabelName(
            $ColumnId integer primary key autoincrement,
            $ColumnName text not null,
            $ColumnUrl text not null
          )
        ''');
      }
    );
  }

  Future<favModel>  insert( favModel fav) async{
    fav.id = await db.insert(tabelName, fav.toMap());
    return fav;
  }

  Future<int> delete(int id) async => await db.delete(tabelName, where: '$ColumnId = ?' ,whereArgs: [id]);

  Future<List<favModel>> getData() async{
    List<Map<String,dynamic>> favMap = await db.query(tabelName);
    List<favModel> favList = [];
    if(favMap.isEmpty) return favList;
    else{
      favMap.forEach((element) { 
        favList.add(favModel.fromMap(element));
      });
      return favList;
    }
  }

  Future close() async => db.close();

}
