import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/config/constants/image_constants.dart';
import 'package:shortly/src/config/constants/text_constants.dart';
import 'package:shortly/src/service/api_service.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shortly/src/utils/extensions/context_extension.dart';
import 'package:shortly/src/utils/widgets/stack.dart';
import 'link_list_page.dart';

class ShortlyHomePage extends StatefulWidget {
  @override
  _ShortlyHomePageState createState() => _ShortlyHomePageState();
}

class _ShortlyHomePageState extends State<ShortlyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _shortenedUrl = "";
    bool isShorteningUrl = false;
    final TextEditingController urlController = TextEditingController();
    UrlModel products = Provider.of<UrlModel>(context);

    final imageConstants = ImageConstants();
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: context.dynamicHeight(0.08),
                          child: SvgPicture.asset(imageConstants.titleUrl),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Switch(
                              value: products.getDarkMode(),
                              onChanged: (value) {
                                products.changeDarkMode(value);
                              }),
                        )
                      ],
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
                      height: 40,
                    ),
                  ],
                ),
                StackisHere(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
