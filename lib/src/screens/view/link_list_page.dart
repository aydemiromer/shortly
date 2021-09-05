import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/model/provider_model.dart';

class LinkList extends StatefulWidget {
  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  var _shortenedUrl = "";
  var _lastShortenedUrl = "";
  List urls = [];

  Future<String> getShortly(String url) async {
    Dio dio = Dio();
    var response = await dio.get("https://api.shrtco.de/v2/shorten?url=" + url);
    print(response);
    if (response.statusCode != 201) {
      return Future.error("Failed to shorten the link!");
    }
    return response.data["result"]["full_short_link"];
  }

  @override
  Widget build(BuildContext context) {
    UrlModel products = Provider.of<UrlModel>(context);
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: textmodel.linklist.length == 0
                      ? Text("Your shopping cart is empty")
                      : ListView.builder(
                          itemCount: textmodel.linklist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(textmodel.linklist[index].url),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    textmodel
                                        .deleteUrl(textmodel.linklist[index]);
                                  },
                                ),
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
