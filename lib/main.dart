import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynewsapp/wallpaperApp/wallpaper.dart';
import 'package:mynewsapp/widgets/authForm.dart';
import 'package:mynewsapp/widgets/day25.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return DatabaseOptionsCrud();
          }else{
            return AuthFormWidget();
          }
        }),
    );
  }
}

//--------------------------------------------------------------------------------------//
//------------------------- Wallpaper App using pexels API -----------------------------//
//-------------------------------------------------------------------------------------//

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   //const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(brightness: Brightness.dark),
//       home: Wallpaper(),
//     );
//   }
// }


//------------------------------------------------------------------------------------------------------//
//-------------------------- Firebase Authentications & CRUD Operations -------------------------------//
//----------------------------------------------------------------------------------------------------//

