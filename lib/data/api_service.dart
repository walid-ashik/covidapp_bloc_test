import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_covidapp_bloc_test/data/models/global.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = "https://coronavirus-19-api.herokuapp.com";

  var headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  Future<Global> fetchGlobalData() async {
    final response =
        await http.get(Uri.parse("$_baseUrl/all"), headers: headers);

    try {
      if (response.statusCode == 200) {
        return Global.fromJson(json.decode(response.body));
      } else {
        return Future.value(null);
      }
    } on SocketException catch (e) {
      throw NoInternetException("No Internet");
    } on HttpException {
      throw NoServiceFoundException("No Service Found");
    } on FormatException {
      throw InvalidFormatException("Invalid Data Format");
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}

//ERRORS
class NoInternetException {
  String message;

  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;

  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;

  InvalidFormatException(this.message);
}

class UnknownException {
  String message;

  UnknownException(this.message);
}
