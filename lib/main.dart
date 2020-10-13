import 'package:flutter/material.dart';
import 'package:webportal_footballguru/mainListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EntryPage(),
    );
  }
}
