import 'package:flutter/material.dart';

import 'scrollable_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrollable List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollablePage(title:'Scrollable List' ),
    );
  }
}

