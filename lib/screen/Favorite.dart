import 'package:flutter/material.dart';
import 'package:foodoo/database/fav%20database.dart';
import 'package:foodoo/database/fav.dart';
import 'package:foodoo/model/info.dart';

import '../api/infoAPI.dart';
import '../model/recipe.dart';
import 'detail.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  List<favModel> favList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<favModel>>(
      future: favDatabase.instance.getData(),
      builder: (BuildContext context, snapshot){
         if(snapshot.hasData){
          favList = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.fromLTRB(8,12,8,4),
            child: GridView.builder(
              itemCount: favList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ), 
          
              itemBuilder: (BuildContext context,int index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), color: Color.fromARGB(255, 243, 240, 240)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: Image.network(favList.elementAt(index).url)
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Text(favList.elementAt(index).name,
                          overflow: TextOverflow.ellipsis,
                        )
                      ),
                    ],
                  )
                  );
              },
            ),
          );
        }
        else if(snapshot.hasError){
          print('Error : ${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}