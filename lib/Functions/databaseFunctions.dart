import 'package:cloud_firestore/cloud_firestore.dart';

create() async{
  await FirebaseFirestore.instance
        .collection('pets') //collectionName
        .doc('kitty') //docName
        .set({
          'name': 'Jerry',
          'animal': 'Cat',
          'age': 10
        });

        print('Database Updated');
}

update(String collName, docName, field, var newFieldValue)async{ //use var when you don't know the variable will be int or string or anything else.
  await FirebaseFirestore.instance
        .collection(collName)
        .doc(docName)
        .update({field: newFieldValue});

        print('Fields Updated');
}

delete(String collName, docName)async{ //You can't delete the whole collections, you have to delete documents.
  await FirebaseFirestore.instance
        .collection(collName)
        .doc(docName)
        .delete();

        print('Document deleted');
}