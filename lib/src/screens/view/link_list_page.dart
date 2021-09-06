import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../model/provider_model.dart';
import '../../utils/extensions/context_extension.dart';
import '../../utils/widgets/stack.dart';

class LinkList extends StatefulWidget {
  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  _shareUrl(String url) {
    Clipboard.setData(ClipboardData(text: url));
    Share.share(url);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: textmodel.linklist.length == 0
                      ? Text("Your card is empty")
                      : buildListViewCard(textmodel),
                ),
                StackisHere(),
              ],
            ),
          ),
        ),
      );
    });
  }

  ListView buildListViewCard(UrlModel textmodel) {
    return ListView.builder(
        itemCount: textmodel.linklist.length,
        itemBuilder: (context, index) {
          return buildCardDataa(context, textmodel, index);
        });
  }

  Card buildCardDataa(BuildContext context, UrlModel textmodel, int index) {
    return Card(
      child: Padding(
        padding: context.paddingAllow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textmodel.linklist[index].url),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    textmodel.deleteUrl(textmodel.linklist[index]);
                  },
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            Text(
              textmodel.linklist[index].urlshort,
              style: TextStyle(color: Colors.teal),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    elevation: 3,
                  ),
                  onPressed: () {
                    _shareUrl(textmodel.linklist[index].urlshort);
                  },
                  child: Text("COPY")),
            )
          ],
        ),
      ),
    );
  }
}
