import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mynewsapp/wallpaperApp/fullscreen.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});
  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {

//-----------------------------------------------------------------------------------------------------------//
//---------------------------------------------Useful Functions----------------------------------------------//
//-----------------------------------------------------------------------------------------------------------//
  List images = [];
  int page = 1;
  @override
  void initState(){ //This functions is firstly executed when the app is loaded
    super.initState();
    fetchapi();
  }
  fetchapi() async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
    headers:{'Authorization':'API_KEY_HERE'}).then((value){
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos']; //photos is the key in JSON.
      });
      
      //print(value.body);
      //print(result);
      //print(images);
      //print(images.length); //80
      //print(images[0]);

    });
  }

  loadmore() async{
    setState(() {
      page = page + 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page='+page.toString();

    await http.get(Uri.parse(url),
    headers:{'Authorization':'API_KEY_HERE'}).then((value){
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);  //photos is the key in JSON.
      });
      
    });
  }
//-----------------------------------------------------------------------------------------------------------//
//-----------------------------------------------Useful Functions--------------------------------------------//
//-----------------------------------------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: GridView.builder(
              itemCount: images.length, //80
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2, childAspectRatio: 2/3, mainAxisSpacing: 2), 
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Fullscreen(
                      imageurl: images[index]['src']['large2x'],
                    )));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Image.network(images[index]['src']['tiny'], fit: BoxFit.cover,),),
                );
              }),
          )),
          InkWell(
            onTap: () {
              loadmore();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(child: Text('Load More', style: TextStyle(fontSize: 20, color: Colors.white)))),
          )
        ],
      ),
    );
  }
}