import 'package:flutter/material.dart';
import 'package:flutter_application_1/Album/Album.dart';
import 'package:flutter_application_1/Album/AlbumList.dart';
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
    final d = Provider.of<Data_provider>(context);
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
          body: Center(
            child: Column(
              children: [
                Container(
                  child: FutureBuilder<AlbumList>(
                    future: d.album,
                    builder: (context, snapshot) {
                      print("1");
                      if (snapshot.hasData) {
                        print("2");
                        return Column(
                          children: [
                            Text(snapshot.data!.albums[0].symbol.toString()),
                          ],
                        );
                      }
                      return const SpinKitRotatingCircle(
                        color: Colors.green,
                        size: 50.0,
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
