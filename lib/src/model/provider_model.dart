import 'package:flutter/material.dart';

class UrlModel extends ChangeNotifier {
  List<Shortly> _urls = [];
  bool isShorteningUrl = false;

  List<Shortly> get allProducts => _urls;

  void addUrl(Shortly shortly) {
    _urls.add(shortly);
    notifyListeners();
  }

  void changePosition(Shortly shortly) {
    isShorteningUrl = true;
    notifyListeners();
  }

  void deleteUrl(Shortly shortly) {
    _urls.remove(shortly);
    notifyListeners();
  }

  List<Shortly> get linklist {
    return _urls;
  }

/*
  Color isButtonColor = Colors.indigo;
  getButtonColor() => this.isButtonColor;
  void changeButtonColor(isButtonColor) {
    this.isButtonColor = Colors.teal;
    notifyListeners();
  }*/

  bool isDarkMode = false;
  getDarkMode() => this.isDarkMode;
  void changeDarkMode(isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}

class Shortly {
  String url;
  String urlshort;
  Shortly({this.url, this.urlshort});
}
