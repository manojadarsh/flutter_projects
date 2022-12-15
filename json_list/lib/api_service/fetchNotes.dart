
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_list/models/note.dart';

Future<List<Note>> fetchNotes() async {
  var urlNotes = 'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
  var responseNotes = await http.get(urlNotes);

  var notes = List<Note>();

  if (responseNotes.statusCode == 200) {
    var notesJson = json.decode(responseNotes.body);
    for (var noteJson in notesJson) {
      notes.add(Note.fromJson(noteJson));
    }
  }
  return notes;
}