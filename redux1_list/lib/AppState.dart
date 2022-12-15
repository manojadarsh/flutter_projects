import 'package:redux1_list/singleItem.dart';

class AppState {
  final List<ToDoItem> toDos;
  final ListState listState;

  AppState(this.toDos, this.listState);

  factory AppState.initial() => AppState(List.unmodifiable([]), ListState.listOnly);
}

enum ListState {
  listOnly, listWithNewItem
}