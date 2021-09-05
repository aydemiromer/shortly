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

  int get count {
    return _urls.length;
  }

  List<Shortly> get linklist {
    return _urls;
  }
}

class Shortly {
  String url;
  String urlshort;
  Shortly({this.url, this.urlshort});
}
