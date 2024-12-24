import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/Functions/databaseFunctions.dart';
import 'package:mynewsapp/pages/pets.dart';
import 'package:mynewsapp/widgets/authForm.dart';
//////////////////////// CRUD Operations /////////////////////////////
class DatabaseOptionsCrud extends StatefulWidget {
  const DatabaseOptionsCrud({super.key});

  @override
  State<DatabaseOptionsCrud> createState() => _DatabaseOptionsCrudState();
}

class _DatabaseOptionsCrudState extends State<DatabaseOptionsCrud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database CRUD'),
        actions: [
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>AuthFormWidget())); 

          }, icon: Icon(Icons.leave_bags_at_home))
        ],),

        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){create();}, child: Text('Creat')),
                ElevatedButton(onPressed: (){update('pets', 'tom', 'age', 13);}, child: Text('Update')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>PetsList())); 
                }, child: Text('Retrieve')),
                ElevatedButton(onPressed: (){delete('pets', 'tom');}, child: Text('Delete')),
                
              ],
            ),
          ),
        ),
      
      
    );
  }
}

//Creat, Retrieve, Update, Delete - CRUD