// Importing firestore package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TODOList extends StatefulWidget {
  final user;

  TODOList(this.user);

  @override
  _TODOListState createState() => _TODOListState(user);
}

class _TODOListState extends State<TODOList> {
  final user;
  _TODOListState(this.user);
  // Setting reference to 'tasks' collection
  final collection = Firestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TODO app'),
      ),
      // Making a StreamBuilder to listen to changes in real time
      body: StreamBuilder<QuerySnapshot>(
        stream: collection.where('uId', isEqualTo: user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Handling errors from firebase
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            // Display if still loading data
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return ListView(
                // Got rid of Task class
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return CheckboxListTile(
                    title: Text(document['name']),
                    value: document['completed'],
                    activeColor: Colors.orange,
                    // Updating the database on task completion
                    onChanged: (newValue) => collection
                        .document(document.documentID)
                        .updateData({'completed': newValue}),
                  );
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
