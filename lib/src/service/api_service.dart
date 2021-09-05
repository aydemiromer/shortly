import 'package:dio/dio.dart';

Future<String> getShortly(String url) async {
  Dio dio = Dio();
  var response = await dio.get("https://api.shrtco.de/v2/shorten?url=" + url);
  print(response);
  if (response.statusCode != 201) {
    return Future.error("Failed to shorten the link!");
  }
  return response.data["result"]["full_short_link"];
}
