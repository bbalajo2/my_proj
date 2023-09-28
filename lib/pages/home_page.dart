import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_data.dart';
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

  void goToNewNotePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => newNotePage(),
      ),
    );
  }

  void deleteNote() {
    Provider.of<NoteData>(context, listen: false).deleteNote();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 99, 174, 169),
        appBar: AppBar(
          title: Text(
            "Current Time: ${DateTime.now().toLocal()}",
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => goToNewNotePage(),
          child: const Icon(Icons.add),
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
                    color: Color.fromARGB(255, 181, 197, 35)),
              ),
            ),
            OutlinedButton(
              onPressed: () => deleteNote(),
              child: Text('Delete last Note'),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromARGB(255, 220, 148, 23),
                textStyle: TextStyle(fontSize: 20),
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
