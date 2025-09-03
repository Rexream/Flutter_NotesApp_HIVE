import "package:hive_ce_flutter/hive_flutter.dart";

class NoteDb {
  List noteList = [];

  final notesHive = Hive.box("NOTEHIVE");

  void createInitData() {
    noteList = [
      ["Örnek Başlık", "Örnek içerik", false],
    ];
  }

  void updateData() {
    notesHive.put("NOTELIST", noteList);
  }

  void loadData() {
    noteList = notesHive.get("NOTELIST");
  }
}
