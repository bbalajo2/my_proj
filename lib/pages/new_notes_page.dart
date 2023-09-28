import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_data.dart';
import '../models/note.dart';
import 'home_page.dart';

void main() => runApp(const newNotePage());

class newNotePage extends StatelessWidget {
  const newNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Creating a new note';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: const NewNotePage(),
        ),
      ),
    );
  }
}

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  NewNotePageState createState() => NewNotePageState();
}

class NewNotePageState extends State<NewNotePage> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  void ReturnBtn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void addNewNoteHandler(BuildContext context) {
    var noteModel = Provider.of<NoteData>(context, listen: false);
    int id =
        Provider.of<NoteData>(context, listen: false).getAllNotes().length + 1;
    noteModel.addNewNote(
      Note(
        id: id,
        text: myController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: myController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addNewNoteHandler(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saving')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ),
          ElevatedButton(
            onPressed: () => ReturnBtn(),
            child: const Text('Return'),
          ),
        ],
      ),
    );
  }
}
