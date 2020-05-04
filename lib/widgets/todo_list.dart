import 'package:flutter/material.dart';
import '../task.dart';

class TODOList extends StatelessWidget {
  final List<Task> tasks;
  final completeTask;

  TODOList({@required this.tasks, @required this.completeTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TODO App'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          return CheckboxListTile(
            activeColor: Colors.orange,
            title: Text(tasks[i].getName()),
            value: tasks[i].isCompleted(),
            onChanged: (_) => completeTask(tasks[i]),
          );
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
