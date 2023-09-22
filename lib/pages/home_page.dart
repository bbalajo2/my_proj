import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_data.dart';  // Import NoteData

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

void addNewNote() {
  
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 217, 19),
        appBar: AppBar(),
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
