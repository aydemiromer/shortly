import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/src/config/constants/image_constants.dart';
import 'package:shortly/src/config/constants/text_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly/src/utils/extensions/context_extension.dart';
import 'package:shortly/src/service/api_service.dart';

class LinkList extends StatefulWidget {
  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  List urls = [];
  var _shortenedUrl = "";
  bool isShorteningUrl = false;
  _shareUrl(String url) {
    Clipboard.setData(ClipboardData(text: url));
    Share.share(url);
  }

  saveToSharedPreferences(String shortenedUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lastUrl", shortenedUrl);
  }

  @override
  Widget build(BuildContext context) {
    UrlModel products = Provider.of<UrlModel>(context);
    final TextEditingController urlController = TextEditingController();
    final imageConstants = ImageConstants();

    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: textmodel.linklist.length == 0
                      ? Text("Your card is empty")
                      : ListView.builder(
                          itemCount: textmodel.linklist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: context.paddingAllow,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(textmodel.linklist[index].url),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            textmodel.deleteUrl(
                                                textmodel.linklist[index]);
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
                                            _shareUrl(textmodel
                                                .linklist[index].urlshort);
                                          },
                                          child: Text("COPY")),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
                Container(
                  color: Colors.purple[300],
                  height: context.dynamicHeight(0.20),
                  width: context.dynamicWidth(1),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: SvgPicture.asset(imageConstants.decorationStack),
                      ),
                      Positioned(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                controller: urlController,
                                decoration: InputDecoration(
                                  hintText: "Shorten a link here ...",
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                obscureText: false,
                              ),
                            ),
                            !isShorteningUrl
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.teal),
                                    onPressed: () async {
                                      var inputUrl = urlController.text;
                                      try {
                                        var shortenedUrl =
                                            await getShortly(inputUrl);
                                        await saveToSharedPreferences(
                                            shortenedUrl);
                                        setState(() {
                                          _shortenedUrl = shortenedUrl;
                                          isShorteningUrl = false;
                                        });
                                      } catch (e) {
                                        setState(() {
                                          isShorteningUrl = false;
                                        });
                                      }
                                      products.addUrl(Shortly(
                                          url: urlController.text,
                                          urlshort: _shortenedUrl));
                                    },
                                    child: Text(
                                        ShortlyTextConstants.homepagebutton),
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.indigo,
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
