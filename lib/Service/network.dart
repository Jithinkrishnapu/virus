
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:virus/Service/countryService.dart';




List<CounterSevice>parseCountry(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<CounterSevice>countries = list.map((model) =>
      CounterSevice.fromJson(model)).toList();
  return countries;
}

Future <List<CounterSevice>> fetchCountry() async {
  final response =
    await http.get('https://coronavirus-19-api.herokuapp.com/countries/');

    if (response.statusCode == 200) {
      return compute(parseCountry,response.body);
    }else{
      throw Exception('Request Api Error');
    }
}