

import 'package:flutter/material.dart';
import 'package:umang/screens/detail_page.dart';
import 'screens/f_home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detail_page': (context) => detailpage()
      },
    ),
  );
}
