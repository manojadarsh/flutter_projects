import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'AlbumModel.dart';

Random random = new Random();
int randomNumber = random.nextInt(100);

Future<Album> fetchAlbum() async {
  final response =
  await http.get('http://shopfreshlii.a3jm.com:9090/springboot-crud-rest/api/v1/productstocks');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}