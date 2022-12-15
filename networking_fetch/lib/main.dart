import 'dart:async';

import 'package:flutter/material.dart';
import 'package:networking_fetch/albumView.dart';

import 'AlbumModel.dart';
import 'fetchAlbum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: albumView(),
    );
  }
}
