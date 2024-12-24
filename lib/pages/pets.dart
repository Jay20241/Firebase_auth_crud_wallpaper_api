import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///////////////////////////// Retrieve Data from database //////////////////////////
class PetsList extends StatefulWidget {
  const PetsList({super.key});

  @override
  State<PetsList> createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pets Info'),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('pets').snapshots(), 
        builder: (context, petSnapshot){
          if (petSnapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            final petDocuments = petSnapshot.data!.docs;
            return ListView.builder(
              itemCount: petDocuments.length,
              itemBuilder: (context, index){
              return Card(
                elevation: 10,
                child: ListTile(
                  title: Text(petDocuments[index]['name']),
                  subtitle: Text(petDocuments[index]['animal']),
                ),
              );
            });
          }
        }),
      ),
    );
  }
}

//This class will continuesoly listen every change in the database.
//Documents in the collections are called snapshots.
//when you want to listen, you can use StreamBuilder, becoz the stream of data is coming