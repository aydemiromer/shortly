import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly/src/config/constants/image_constants.dart';
import 'package:shortly/src/config/constants/text_constants.dart';
import 'package:shortly/src/screens/view/link_list_page.dart';
import 'package:shortly/src/service/api_service.dart';
import 'package:shortly/src/model/provider_model.dart';
import 'package:shortly/src/utils/extensions/context_extension.dart';

class StackisHere extends StatefulWidget {
  @override
  _StackisHereState createState() => _StackisHereState();
}

class _StackisHereState extends State<StackisHere> {
  @override
  Widget build(BuildContext context) {
    var _shortenedUrl = "";
    bool isShorteningUrl = false;
    final TextEditingController urlController = TextEditingController();
    UrlModel products = Provider.of<UrlModel>(context);

    final imageConstants = ImageConstants();
    return Consumer<UrlModel>(builder: (context, textmodel, child) {
      return Container(
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
                      controller: urlController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Shorten a link here ...",
                        hoverColor: Colors.teal,
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: false,
                    ),
                  ),
                  !isShorteningUrl
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.indigo;
                                return Colors.teal;
                              },
                            ),
                          ),
                          onPressed: () async {
                            var inputUrl = urlController.text;
                            try {
                              var shortenedUrl = await getShortly(inputUrl);
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

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LinkList(),
                              ),
                            );
                          },
                          child: Text(ShortlyTextConstants.homepagebutton),
                        )
                      : CircularProgressIndicator(
                          color: Colors.indigo,
                        )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
