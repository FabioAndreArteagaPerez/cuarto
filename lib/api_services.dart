import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiServices {
  final String url = 'https://allugofrases.herokuapp.com/frases/random';
  final http.Client httpClient;
  ApiServices({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List> getLucky() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return List.fromJson(json);
  }
}
