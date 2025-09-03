import 'package:flutter/material.dart';

import 'package:not_defteri/database/note_db.dart';
import 'package:not_defteri/pages/note_tile.dart';
import 'package:not_defteri/utilities/alert_dialog.dart';
import 'package:not_defteri/utilities/appbar.dart';

import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";

import 'package:hive_ce_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final notesHive = Hive.box("NOTEHIVE");
  NoteDb noteDataBase = NoteDb();

  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteText = TextEditingController();

  late bool doesHaveNote;

  @override
  void initState() {
    super.initState();

    if (notesHive.get("NOTELIST") == null) {
      noteDataBase.createInitData();
    } else {
      noteDataBase.loadData();
    }
  }

  void deleteSelectedNotes() {
    noteDataBase.noteList.removeWhere((item) => item[2] == true);
    noteDataBase.updateData();
  }

  void newNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AddNote(
        noteTitle: noteTitle,
        noteText: noteText,
        onSave: addNewNote,
      ),
    );
  }

  void addNewNote() {
    setState(() {
      noteDataBase.noteList.add([noteTitle.text, noteText.text, false]);
      noteDataBase.updateData();
    });

    noteTitle.clear();
    noteText.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: appBarAdd("NOT DEFTERİ"),

      //Floating Action Button
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                deleteSelectedNotes();
              });
            },

            child: Icon(Icons.delete),
          ),

          SizedBox(height: 4),

          FloatingActionButton(
            onPressed: newNoteDialog,

            child: Icon(Icons.add),
          ),
        ],
      ),

      //Body
      body: Padding(
        padding: EdgeInsets.all(30),

        child: noteDataBase.noteList.isEmpty
            ? Center(
                child: Text(
                  "NOTUNUZ BULUNMAMAKTA",
                  style: TextStyle(
                    color: const Color(0xFF868686),
                    fontSize: 20,
                  ),
                ),
              )
            : MasonryGridView.count(
                crossAxisCount: 2,

                mainAxisSpacing: 8,
                crossAxisSpacing: 8,

                itemCount: noteDataBase.noteList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      setState(() {
                        noteDataBase.noteList[index][2] =
                            !noteDataBase.noteList[index][2];
                      });
                    },

                    child: NoteTile(
                      noteTitle: noteDataBase.noteList[index][0],
                      noteText: noteDataBase.noteList[index][1],
                      isSelectable: noteDataBase.noteList[index][2],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
