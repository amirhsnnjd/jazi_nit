import 'package:flutter/material.dart';
import 'package:flutter_application_1/Album/Album.dart';
import 'package:flutter_application_1/Album/AlbumList.dart';
import 'package:flutter_application_1/coin.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/provider/Data.dart';
import 'package:flutter_application_1/provider/Update.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      ChangeNotifierProvider<Data_provider>(
        create: (context) => Data_provider(),
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
    final a = Provider.of<update>(context);
    final d = Provider.of<Data_provider>(context);
    a.refresh();
    return MaterialApp(
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
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
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
                                ),
                                for (int j = 0;
                                    j < snapshot.data!.albums.length;
                                    j++)
                                  Coin(snapshot.data!.albums[j]),
                              ],
                            );
                          }
                          return Center(
                            child: const SpinKitRotatingCircle(
                              color: Colors.blue,
                              size: 50.0,
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
