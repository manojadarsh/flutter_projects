import 'dart:async';

import 'package:flutter/material.dart';
import 'package:networking_fetch/albumCreate.dart';

import 'AlbumModel.dart';
import 'fetchAlbum.dart';

class albumView extends StatefulWidget {
  albumView({Key key}) : super(key: key);

  @override
  _albumViewState createState() => _albumViewState();
}

class _albumViewState extends State<albumView> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(
          children: [
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.product_description);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => albumCreate()
                  ));
                }
            ),
          ],
        ),
      ),
    );
  }
}
