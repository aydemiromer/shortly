import 'package:flutter/material.dart';

class UrlModel extends ChangeNotifier {
  List<Shortly> _urls = [];

  List<Shortly> get allProducts => _urls;

  void addUrl(Shortly shortly) {
    _urls.add(shortly);
    notifyListeners();
  }

  void deleteUrl(Shortly shortly) {
    _urls.remove(shortly);
    notifyListeners();
  }
}

class Shortly {
  String url;
}
