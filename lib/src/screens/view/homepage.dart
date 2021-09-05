import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/config/constants/image_constants.dart';
import 'package:shortly/src/config/constants/text_constants.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shortly/src/utils/extensions/context_extension.dart';

import 'link_list_page.dart';

class ShortlyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();

    UrlModel products = Provider.of<UrlModel>(context);

    final imageConstants = ImageConstants();
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.paddingTop,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: context.dynamicHeight(0.08),
                      child: SvgPicture.asset(imageConstants.titleUrl),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: context.dynamicHeight(0.5),
                      width: context.dynamicWidth(1),
                      child: SvgPicture.asset(imageConstants.homePageUrl),
                    ),
                    Text(
                      ShortlyTextConstants.homepageheader,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(ShortlyTextConstants.homepagesecond,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 17, wordSpacing: 5)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.purple[300],
                      height: context.dynamicHeight(0.20),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 20,
                            child: SvgPicture.asset(
                                imageConstants.decorationStack),
                          ),
                          Column(
                            children: [
                              TextField(
                                controller: urlController,
                                decoration: InputDecoration(
                                  hintText: "Shorten a link here ...",
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                obscureText: false,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    products.addUrl(
                                        Shortly(url: urlController.text));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => LinkList()));
                                  },
                                  child:
                                      Text(ShortlyTextConstants.homepagebutton))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
