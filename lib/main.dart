import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/list.dart';
import 'widgets/create.dart';
import 'widgets/login.dart';
import './task.dart';
import './auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> tasks = [];
  final Authentication auth = new Authentication();
  FirebaseUser user;

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

  void onLogin(FirebaseUser user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      // home: Home(),
      routes: {
        '/': (context) => TODOLogin(onLogin: onLogin),
        '/list': (context) =>
            TODOList(),
        '/create': (context) => TODOCreate(),
      },
    );
  }
}
