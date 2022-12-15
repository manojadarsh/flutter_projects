import 'package:redux/redux.dart';
import 'package:redux1_list/singleItem.dart';

import 'AppState.dart';
import 'actions.dart';


AppState appReducer(AppState state, action) => AppState(toDoListReducer(state.toDos, action), listStateReducer(state.listState, action));

final Reducer<List<ToDoItem>> toDoListReducer = combineReducers([
  TypedReducer<List<ToDoItem>, AddItemAction>(_addItem),
  TypedReducer<List<ToDoItem>, RemoveItemAction>(_removeItem),
]);

List<ToDoItem> _removeItem(List<ToDoItem> toDos, RemoveItemAction action) => List.unmodifiable(List.from(toDos)..remove(action.item));

List<ToDoItem> _addItem(List<ToDoItem> toDos, AddItemAction action) => List.unmodifiable(List.from(toDos)..add(action.item));

final Reducer<ListState> listStateReducer = combineReducers<ListState>([
  TypedReducer<ListState, DisplayListOnlyAction>(_displayListOnly),
  TypedReducer<ListState, DisplayListWithNewItemAction>(_displayListWithNewItem),
]);

ListState _displayListOnly(ListState listState, DisplayListOnlyAction action) => ListState.listOnly;

ListState _displayListWithNewItem(ListState listState, DisplayListWithNewItemAction action) => ListState.listWithNewItem;