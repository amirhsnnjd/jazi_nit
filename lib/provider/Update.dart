import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class update with ChangeNotifier {
  var arr = ["safe", "free", "fast", "up to date"];
  var txt = "safe";
  int i = 1;

  void refresh() {
    Timer mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
      txt = arr[i];
      notifyListeners();
      if (i <= 2)
        i++;
      else
        i = 0;
    });
    /*if (i > 3) {
      mytimer.cancel();
      i = 0;
      refresh();
    }*/
  }
}
