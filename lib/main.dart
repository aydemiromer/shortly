import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shortly/src/screens/view/homepage.dart';
import 'package:shortly/src/screens/view/link_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UrlModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shortly',
        home: ShortlyHomePage(),
      ),
    );
  }
}
