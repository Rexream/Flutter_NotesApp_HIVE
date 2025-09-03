import "package:flutter/material.dart";

//APPBAR
AppBar appBarAdd(String appBarTitle) {
  return AppBar(
    title: Text(appBarTitle),
    centerTitle: true,
    toolbarHeight: 100,
    elevation: 0,

    backgroundColor: const Color(0xFF202124),
    foregroundColor: const Color(0xFFB3B3B3),

    shape: Border(
      bottom: BorderSide(width: 2, color: const Color(0xFFB3B3B3)),
    ),
  );
}
