import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Album/AlbumList.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../Album/Album.dart';

class Data_provider with ChangeNotifier {
  late Future<AlbumList> album = FetchAlbum();
  late AsyncSnapshot<Autogenerated> snapshot;

  Future<AlbumList> FetchAlbum() async {
    final _response = await http.get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=true"));
    if (_response.statusCode == 200)
      return AlbumList.FromJson(jsonDecode(_response.body));
    else
      throw Exception("error");
  }

  void set(AsyncSnapshot<Autogenerated> s) {
    snapshot = s;
    notifyListeners();
  }

  Future<void> get() async {
    album = FetchAlbum();
    notifyListeners();
  }
}
