import 'package:flutter/foundation.dart';
import 'package:json_photo/model/user.dart';
import 'package:http/http.dart' as http;
import 'parseUsers.dart';

Future<List<User>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/posts');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseUsers, response.body);
}