import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/Update.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'main.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var txt = "updated";

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<update>(context);
    a.refresh();
    final _formkey = GlobalKey<FormState>();
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
                    child: Text("Login"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Signup"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                } else if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                } else if (value == 2) {}
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
                              a.txt,
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
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
                                  else
                                    return null;
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
                                  else
                                    return null;
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    hintText: 'name',
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
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    suffixIconColor: Colors.black,
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: ((value) {
                                  if (value!.isEmpty ||
                                      value == null ||
                                      value.characters.length < 8)
                                    return ('name should be more than 8 charachters');
                                  else
                                    return null;
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    hintText: 'lastname',
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
                                      Icons.person_add,
                                      color: Colors.black,
                                    ),
                                    suffixIconColor: Colors.black,
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: ((value) {
                                  if (value!.isEmpty ||
                                      value == null ||
                                      value.characters.length < 10)
                                    return ('last name should be more than 10 characters');
                                  else
                                    return null;
                                }),
                              ),
                            ),
                          ),
                          //age
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Container(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'age',
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
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),
                                    suffixIconColor: Colors.black,
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: ((value) {
                                  if (value!.isEmpty ||
                                      value == null ||
                                      !RegExp(r"^[1-9][0-9]+").hasMatch(value))
                                    return ('please enter your age');
                                  else
                                    return null;
                                }),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () => {
                                if (_formkey.currentState!.validate())
                                  {
                                    /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessPage()),
                              )*/
                                  }
                              },
                              backgroundColor: Colors.white,
                              tooltip: 'Increment',
                              child: const Icon(
                                Icons.done,
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
