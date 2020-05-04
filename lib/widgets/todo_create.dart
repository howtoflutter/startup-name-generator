import 'package:flutter/material.dart';

class TODOCreate extends StatefulWidget {
  final createTask;

  TODOCreate({@required this.createTask});
  @override
  _TODOCreateState createState() => _TODOCreateState();
}

class _TODOCreateState extends State<TODOCreate> {
  final TextEditingController controller = TextEditingController();

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
              labelText: "Enter the task",
              icon: Icon(Icons.insert_comment)
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          widget.createTask(controller.text);
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
