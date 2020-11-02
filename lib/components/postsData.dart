import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'loadPost.dart';

class Posts extends ChangeNotifier {
  List<Load> _loads = [
    Load(
      userName: "Mridul Swarup",
      origin: "Aligarh",
      destination: "Faridabad",
      loadType: "Part Load",
      loadWeight: 500,
      eta: 5,
    ),
  ];

  UnmodifiableListView<Load> get load {
    return UnmodifiableListView(_loads);
  }

  int get loadCount {
    return _loads.length;
  }

  // void addTask(String name) {
  //   final load = Load(userName: name);
  //   _loads.add(load);
  //   notifyListeners();
  // }

  // void updateTask(Load load) {
  //   load.toggleDone();
  //   notifyListeners();
  // }

  void deleteTask(Load load) {
    _loads.remove(load);
    notifyListeners();
  }
}
