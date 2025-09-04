import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final TextEditingController noteTitle;
  final TextEditingController noteText;
  final VoidCallback onSave;

  const AddNote({
    super.key,
    required this.noteTitle,
    required this.noteText,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF868686),
      contentPadding: EdgeInsets.all(20),

      content: SizedBox(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFF292929),
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              padding: EdgeInsets.only(left: 5),

              child: TextField(
                controller: noteTitle,

                decoration: InputDecoration(
                  hintText: "Başlık",
                  hintStyle: TextStyle(fontSize: 25),
                ),

                expands: false,
                maxLines: null,
                cursorHeight: 25,

                style: TextStyle(fontSize: 25, height: 1),
              ),
            ),

            SizedBox(height: 5),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFF292929),
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              padding: EdgeInsets.only(left: 5),

              child: TextField(
                controller: noteText,

                decoration: InputDecoration(
                  hintText: "İçerik",
                  hintStyle: TextStyle(fontSize: 20),
                ),

                expands: false,
                maxLines: 8,
                cursorHeight: 20,

                style: TextStyle(fontSize: 20),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF329135),
                    foregroundColor: const Color(0xFFD1D1D1),
                    elevation: 2,
                  ),

                  onPressed: onSave,

                  child: Text("KAYDET"),
                ),

                SizedBox(width: 5),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF913232),
                    foregroundColor: const Color(0xFFD1D1D1),
                    elevation: 2,
                  ),

                  onPressed: () {
                    Navigator.of(context).pop();
                    noteTitle.clear();
                    noteText.clear();
                  },

                  child: Text("İPTAL ET"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
