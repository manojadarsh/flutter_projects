import 'package:flutter/foundation.dart';
import 'package:json_photo/model/photo.dart';
import 'package:http/http.dart' as http;
import 'parsePhotos.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}