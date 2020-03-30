import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class AllCases {
  final int cases;
  final int deaths;
  final int recovered;

  AllCases({this.cases, this.deaths, this.recovered});

  factory AllCases.fromJson(Map<String, dynamic> json) {
    return AllCases(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}

Future<AllCases> fetchCases() async {
  final response = await http.get('https://corona.lmao.ninja/all');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AllCases.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



