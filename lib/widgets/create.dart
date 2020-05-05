import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TODOCreate extends StatefulWidget {

  final user;

  TODOCreate(this.user);

  @override
  _TODOCreateState createState() => _TODOCreateState(user);
}

class _TODOCreateState extends State<TODOCreate> {
  final TextEditingController controller = TextEditingController();
  final collection = Firestore.instance.collection('tasks');
  final user;

  _TODOCreateState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Create Task'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            cursorRadius: Radius.circular(20.0),
            cursorColor: Colors.orange,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.orange,
            ),
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
                labelText: "Enter the task", icon: Icon(Icons.insert_comment)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {

          await collection.add({'name': controller.text, 'completed': false, 'uId': user.uid});
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
