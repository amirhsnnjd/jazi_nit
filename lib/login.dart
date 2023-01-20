import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Update.dart';
import 'package:flutter_application_1/provider/shared.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txt = "updated";
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    // final a = Provider.of<update>(context);
    final s = Provider.of<shared>(context);
    String? pas;
    String? user;
    //a.refresh();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    child: Row(
                      children: [
                        Text("Login"),
                        Icon(
                          Icons.login,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Text("logout"),
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                } else if (value == 1) {
                } else if (value == 2) {
                  s.login.clear();
                }
              }),
            ],
          ),
          body: ListView(children: [
            Column(
              children: [
                Container(
                  width: 400,
                  height: 270,
                  color: Colors.blue[400],
                  //text cany.coin
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "welcome to",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              "  Cany.COIN",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "   our app is ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              /*a.txt*/ "safe",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
                //form
                Container(
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                            child: Container(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: 'email',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 5.0),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    suffixIconColor: Colors.black,
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: ((value) {
                                  if (value!.isEmpty ||
                                      value == null ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value))
                                    return ('email is wrong');
                                  else {
                                    user = value;
                                    return null;
                                  }
                                }),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Container(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 5.0),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    ),
                                    suffixIconColor: Colors.black,
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: ((value) {
                                  if (value!.isEmpty || value == null)
                                    return ('please enter password');
                                  else {
                                    pas = value;
                                    return null;
                                  }
                                }),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()),
                                    )
                                  },
                              child: Text(
                                "don't have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic),
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () => {
                                if (_formkey.currentState!.validate())
                                  {
                                    if (user == s.login.getString("user") &&
                                        pas == s.login.getString("pass"))
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Main()),
                                      )
                                  }
                              },
                              backgroundColor: Colors.white,
                              tooltip: 'Increment',
                              child: const Icon(
                                Icons.login,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ])),
    );
  }
}
