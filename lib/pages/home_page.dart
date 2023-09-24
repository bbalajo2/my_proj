import 'dart:async';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_data.dart';
import '../models/note.dart';
import "../pages/new_notes_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void addNewNote() {
    int id = Provider.of<NoteData>(context as BuildContext, listen: false).getAllNotes().length + 1;
    Note newNote = Note(
      id: id,
      text: "",
    );

    goToNewNotePage(newNote);
  }

  void goToNewNotePage(Note note) {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => newNotePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 217, 19),
        appBar: AppBar(
          title: Text(
            "Current Time: ${DateTime.now().toLocal()}",
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNewNote(),
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, top: 75),
              child: Text(
                "Notes App",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: noteData.getAllNotes().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(noteData.getAllNotes()[index].text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
