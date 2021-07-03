import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:home_page_app/api_utils/api_response.dart';
import 'package:home_page_app/api_utils/sharedPreference.dart';

Future<Response> callAPI(String url) async {
  var completer = Completer<Response>();
  var apiUrl = Uri.parse(url);
  var client = HttpClient(); 

  

  // Create request
  print('url: $url');

  HttpClientRequest request;

  try {
    request = await client.getUrl(apiUrl);
    HttpClientResponse httpResponse;
    httpResponse = await request.close();


    final contents = StringBuffer();
    httpResponse.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () async {
      Response response = Response(
          body: contents.toString(), statusCode: httpResponse.statusCode);
      print('Response: ${response.body.toString()}');

      await setPref(url,response.body);
      completer.complete(response);
    });
  } catch (e){
    String value = await getPref(url);
    Response response = Response(
        body: value, statusCode: 200);
    print('Response: ${response.body.toString()}');
    completer.complete(response);
  }

  return completer.future;
}


