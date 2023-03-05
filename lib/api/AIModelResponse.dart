import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cinema_ai/Models/AIModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIModelResponse {
  // @terro do we need this class here?
  static Future<List<AIModel>> getModel() async {
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
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log(value);
      }
      return AIModel.modelsFromSnapshot(temp);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}