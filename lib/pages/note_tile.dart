import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteText;

  const NoteTile({
    super.key,
    required this.noteTitle,
    required this.noteText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteTitle,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: const Color(0xFF000000),
                ),
              ),

              SizedBox(height: 10),

              Text(
                noteText,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
