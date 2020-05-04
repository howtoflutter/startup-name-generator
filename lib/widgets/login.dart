import 'package:flutter/material.dart';
import 'package:startup_name_generator/auth.dart';

class TODOLogin extends StatefulWidget {
  final onLogin;
  TODOLogin({@required this.onLogin});

  @override
  _TODOLoginState createState() => _TODOLoginState();
}

class _TODOLoginState extends State<TODOLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final auth = Authentication();

  void doLogin() async {
    final user =
        await auth.login(emailController.text, passwordController.text);
    if (user != null) {
      widget.onLogin(user);
      Navigator.pushReplacementNamed(context, '/list');
    } else {
      _showAuthFailedDialog();
    }
  }

  void _showAuthFailedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Could not log in'),
          content: Text('Double check your credentials and try again'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO Login'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: passwordController,
              ),
            ),
            RaisedButton(
              onPressed: doLogin,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.orange,
              padding: EdgeInsets.only(right: 10),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    );
  }
}
