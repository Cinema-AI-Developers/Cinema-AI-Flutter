import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIModelResponse {
  // @terro do we need this class here?
  static Future<void> getModel() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.openai.com/v1/models"),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['OPENAI_API'].toString()}'
        },
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print(error);
    }
  }
}
