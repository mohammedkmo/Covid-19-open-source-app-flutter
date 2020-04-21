import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

List flags;





Future<String> fetchFlags() async {

  final response =  await http.get(Uri.encodeFull("https://corona.lmao.ninja/v2/countries"),
      headers: {
        "Accept" : "application/json",


      }



  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.


      flags = json.decode(response.body);




    return "good";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



