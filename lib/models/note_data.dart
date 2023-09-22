import 'package:flutter/material.dart';
import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [
    Note(id: 0, text: "Name: John Doe"),
    Note(id: 1, text: "Test number 2")
  ];

  List<Note> getAllNotes(){
    notifyListeners(); 
    return allNotes;
  }

  void addNewNote(Note note){
    allNotes.add(note);
    notifyListeners();
  }

  void deleteNote(){
    allNotes.removeLast();
    notifyListeners();
  }

  void updateNote(Note note, String newText){
    for (int i = 0; i < allNotes.length; i++) {
      if(allNotes[i].id == note.id){
        allNotes[i].text = newText;
      }
    }
    notifyListeners();
  }
}
