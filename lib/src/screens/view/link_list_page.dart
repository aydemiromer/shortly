import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinkList extends StatefulWidget {
  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  List urls = [];
  _shareUrl(String url) {
    Clipboard.setData(ClipboardData(text: url));
    Share.share(url);
  }

  @override
  Widget build(BuildContext context) {
    //UrlModel products = Provider.of<UrlModel>(context);
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
                              child: Column(
                                children: [
                                  Text(textmodel.linklist[index].url),
                                  Text(textmodel.linklist[index].urlshort),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          textmodel.deleteUrl(
                                              textmodel.linklist[index]);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.copy),
                                        onPressed: () {
                                          _shareUrl(textmodel
                                              .linklist[index].urlshort);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
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
