import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
List GetList;

String by;

Future<String> fetchBy() async {

  final response =  await http.get(Uri.encodeFull("https://corona.lmao.ninja/v2/countries?sort=$by"),
      headers: {
        "Accept" : "application/json",


      }



  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.


    GetList = json.decode(response.body);


    return "good";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



