import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz/model.dart';

class Todotask with ChangeNotifier {
  final List<model> _titles = [
    model(title: "to go to gym ", ischecked: false),
    model(title: "to  play football", ischecked: false)
  ];
 get titles => _titles;
  void addtask(String newtasktitle) {
    var newtask = model(title: newtasktitle, ischecked: false);
   titles .add(newtask);
    notifyListeners();
  }
}
