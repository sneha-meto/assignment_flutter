import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:assignmentapp/Arena_Model.dart';

String url =
    "http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10";

Future<List<Arena>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allArenasFromJson(response.body);
}
