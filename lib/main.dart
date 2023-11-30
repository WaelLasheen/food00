import 'package:flutter/material.dart';
import 'package:foodoo/database/fav%20database.dart';
import 'package:foodoo/screen/Favorite.dart';
import 'package:foodoo/screen/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await favDatabase.instance.open(); 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  List<String> appBarTitle = ["Home" , 'Favorite Recipe', 'Shopping List' ,'About' ,'Account'];
  List<Widget> pages = [
      const home(),
      Favorite(),
      const Center(child: Text('comming soon')),
      const Center(child: Text('comming soon')),
      const Center(child: Text('comming soon')),
    ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Text(appBarTitle[currentPage] ,style: TextStyle(color: Colors.green[900], fontSize: 28 ,fontWeight: FontWeight.bold), ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.format_align_left),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ],
          iconTheme: IconThemeData(size: 28,color: Colors.green[900]),
        ),

        body: pages[currentPage],

        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.green[900] , size: 28),
          unselectedIconTheme: const IconThemeData(color: Colors.black , size: 28),
          currentIndex: currentPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
            ),
          ],

          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
    );
  }
}