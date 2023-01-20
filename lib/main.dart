import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Album/Album.dart';
import 'package:flutter_application_1/Album/AlbumList.dart';
import 'package:flutter_application_1/coin.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/provider/Data.dart';
import 'package:flutter_application_1/provider/Update.dart';
import 'package:flutter_application_1/provider/shared.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false, home: new Main());
  }
}

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<update>(
        create: (context) => update(),
      ),
      ChangeNotifierProvider<Data_provider>(
        create: (context) => Data_provider(),
      ),
      ChangeNotifierProvider<shared>(
        create: (context) => shared(),
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
    showAlertDialog(BuildContext context) {
      // Create button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("logout"),
        content: Text("you logged out."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    final a = Provider.of<update>(context);
    final d = Provider.of<Data_provider>(context);
    final s = Provider.of<shared>(context);
    s.initial();
    a.refresh();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Cany COIN"),
            backgroundColor: Colors.blue,
            actions: [
              PopupMenuButton(
                  //icon: Icon(Icons.list_outlined),
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
                } else if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                } else if (value == 2) {
                  s.login.clear();
                  showAlertDialog(context);
                }
              }),
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      child: FutureBuilder<AlbumList>(
                        future: d.album,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Container(
                                  width: 400,
                                  height: 270,
                                  color: Colors.blue[400],
                                  //text cany.coin
                                  child: Column(
                                    children: [
                                      if (s.login.getString("user") != null)
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.person),
                                              Text(
                                                s.login
                                                    .getString("user")
                                                    .toString(),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Center(
                                          child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 100, 0, 0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "welcome to",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "  Cany.COIN",
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 24),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "   our app is ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  a.txt,
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 24),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "    image          symbol               price             chnage ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                for (int j = 0;
                                    j < snapshot.data!.albums.length;
                                    j++)
                                  Coin(snapshot.data!.albums[j]),
                              ],
                            );
                          }
                          return Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Center(
                                child: const SpinKitRotatingCircle(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
