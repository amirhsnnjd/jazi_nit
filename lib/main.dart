import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/provider/Update.dart';
import 'package:flutter_application_1/signup.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Main());
  }
}

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<update>(
        create: (context) => update(),
      ),
    ],
    child: MyApp(),
  ));
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cany COIN"),
          backgroundColor: Colors.blue,
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                // icon: Icon(Icons.book)
                itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Text("Home"),
                      Icon(
                        Icons.home,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Login"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Signup"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              } else if (value == 2) {
                print("hi");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              }
            }),
          ],
        ),
        body: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              "Log in",
              style: TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
