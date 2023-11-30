import 'package:flutter/material.dart';
import 'package:foodoo/screen/detail.dart';
import '../api/recipeAPI.dart';
import '../model/recipe.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<recipeModel>(
      future: RecipeAPI().fetchData(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          recipeModel data = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              ),
              itemCount: data.results!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => details(recipe: data.results!.elementAt(index),)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), color: Color.fromARGB(255, 243, 240, 240)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: Image.network(data.results!.elementAt(index).image!)
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: Text(data.results!.elementAt(index).title!,
                            overflow: TextOverflow.ellipsis,
                          )
                        ),
                      ],
                    )
                    ),
                );
              },
          );
        }
        else if(snapshot.hasError){
          print('Error ${snapshot.error}');
        }

        return  const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}