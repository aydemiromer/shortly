import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shortly/src/screens/view/homepage.dart';

void main() => runApp(ChangeNotifierProvider<UrlModel>(
    create: (context) => UrlModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<UrlModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
      title: 'Shortly',
      home: ShortlyHomePage(),
    );
  }
}
