import 'package:flutter/material.dart';
import 'package:foodoo/database/fav%20database.dart';
import 'package:foodoo/database/fav.dart';
import 'package:foodoo/model/recipe.dart';
import '../api/infoAPI.dart';
import '../model/info.dart';

class details extends StatefulWidget {
  final Results recipe ;
  const details({super.key, required this.recipe});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  late int id;
  late infoModel data;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    id = widget.recipe.id!;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: (){
                setState(() {
                  isFav = !isFav;
                  if(isFav){
                    favDatabase.instance.insert(favModel(name: data.title! , url: data.image! ,id: id ));
                  }
                  else{
                    favDatabase.instance.delete(id);
                  }
                });
              }, 
              icon: isFav? const Icon(Icons.favorite, color: Colors.red,)
                : const Icon(Icons.favorite_border_outlined)
            ),

            IconButton(onPressed: (){}, icon: const Icon(Icons.play_arrow)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          ],
          leading: IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.arrow_back ,color: Colors.green[800], size: 28,)),
        ),

        body: FutureBuilder<infoModel>(
          future: infoAPI().fetchData(id),
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData){
              data = snapshot.data!;
              return ListView(
                children: [
                  Image.network(data.image!),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(data.title!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0E8C74)
                            ),
                          )
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Esay',style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w400),),   // don't find it in API
                            Column(
                              children: [
                                const Icon(Icons.access_time ,color: Color(0xFF0E8C74),),
                                const SizedBox(height: 8,),
                                Text("${data.readyInMinutes!}  mins")  
                              ],
                            ),
                            Column(
                              children: [
                                Text('${data.extendedIngredients!}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF0E8C74)
                                  ),
                                ), 
                                const SizedBox(height: 8,),
                                const Text('ingradiants') 
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                  
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(data.instructions!),
                        ),
                        const Divider(),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text("${data.servings} Serving"),
                              const Expanded(child: SizedBox()),

                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: const Color(0xFF0E8C74) ,width: 1.3)
                                ),
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: (){}, 
                                    icon: const Icon(Icons.add ,size: 18,))
                                )
                              ),

                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: const Color(0xFF0E8C74) ,width: 1.3)
                                ),
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: (){}, 
                                    icon: const Icon(Icons.remove ,size: 18,))
                                )
                              ),
                            ],
                          ),
                        ),

                        const Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("ingradiant's",
                              style: TextStyle(
                                color: Color(0xFF0E8C74),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 24,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF0E8C74),width: 1.3),
                                borderRadius: const BorderRadius.all(Radius.circular(8))
                              ),
                              child: TextButton(
                                  onPressed: (){}, 
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Text('add to Grocery List',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                    ),
                                  )
                                )
                              )
                          ],
                        ),
                        const Divider(),

                        const SizedBox(height: 20,)   /////// move it after end

                      ],
                    ),
                  ),

                ],
              );
            }
            else if(snapshot.hasError){
              print('ERROR : ${snapshot.error}');
            }

            return const Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}