import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux1_list/reducers.dart';

import 'AppState.dart';
import 'listPage.dart';
import 'middleware.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer, /* Function defined in the reducers file */
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  Widget build(BuildContext context) => StoreProvider(
    store: this.store,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoListPage(),
    ),
  );
}
