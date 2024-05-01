import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../Model/items.dart';

class ApiService {

  //Reading From Url
  // static Future<ListItem> fetchlesson() async {
  //   final response = await http.get(
  //       Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
  //
  //   if(response.statusCode == 200){
  //     Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //     print('------------>${response.body}');
  //     return ListItem.fromJson(jsonResponse);
  //   }else{
  //     throw Exception('Failed to load lesson');
  //   }
  // }

  //Reading From Assets
  static Future<List<Items>> fetchLessons() async {
    print('---------------->Reading From Assets');
    final String response = await rootBundle.loadString('assets/assign_api.json');
    if(response != null){
     List<dynamic> jsonResponse = jsonDecode(response);
      print('---------------->${jsonResponse}');
      return jsonResponse.map((json) => Items.fromJson(json)).toList();
    }else{
      throw Exception("Failed To Load Lesson");
    }
  }
}
