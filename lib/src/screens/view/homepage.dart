import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/constants/image_constants.dart';
import '../../config/constants/text_constants.dart';
import '../../model/provider_model.dart';
import '../../utils/extensions/context_extension.dart';
import '../../utils/widgets/stack.dart';

class ShortlyHomePage extends StatefulWidget {
  @override
  _ShortlyHomePageState createState() => _ShortlyHomePageState();
}

class _ShortlyHomePageState extends State<ShortlyHomePage> {
  @override
  Widget build(BuildContext context) {
    UrlModel products = Provider.of<UrlModel>(context);

    final imageConstants = ImageConstants();
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Scaffold(
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      homePageTop(context, imageConstants, products),
                      Container(
                        alignment: Alignment.center,
                        height: context.dynamicHeight(0.5),
                        width: context.dynamicWidth(1),
                        child: SvgPicture.asset(imageConstants.homePageUrl),
                      ),
                      Text(
                        ShortlyTextConstants.homepageheader,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(ShortlyTextConstants.homepagesecond,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(fontSize: 17, wordSpacing: 5)),
                      ),
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
        ),
      );
    });
  }

  Row homePageTop(
      BuildContext context, ImageConstants imageConstants, UrlModel products) {
    return Row(
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
    );
  }
}
