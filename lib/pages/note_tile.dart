import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteText;
  final bool isSelectable;

  const NoteTile({
    super.key,
    required this.noteTitle,
    required this.noteText,
    required this.isSelectable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF868686),
        borderRadius: BorderRadius.circular(12),
        border: isSelectable
            ? BoxBorder.all(color: const Color(0xFF8D0101), width: 4)
            : BoxBorder.all(color: const Color(0xFF292929), width: 4),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteTitle,
            style: TextStyle(fontSize: 32, color: const Color(0xFF000000)),
          ),
          Text(
            noteText,
            style: TextStyle(fontSize: 20, color: const Color(0xFF000000)),
          ),
        ],
      ),
    );
  }
}
