import 'package:flutter/material.dart';
import 'widgets/todo_list.dart';
import 'widgets/todo_create.dart';
import './task.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> tasks = [];

  void createTask(String name) {
    setState(() {
      tasks.add(Task(name, false));
    });
  }

  void completeTask(Task task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      // home: Home(),
      routes: {
        '/': (context) => TODOList(tasks: tasks, completeTask: completeTask),
        '/create': (context) => TODOCreate(createTask: createTask),
      },
    );
  }
}
