import 'package:crystal/pages/home_page.dart';
import 'package:crystal/services/data/data_manager.dart';
import 'package:flutter/material.dart';

void main() {
  DataManager.getInstance().loadData();
  runApp(const Crystal());
}

class Crystal extends StatelessWidget {

  const Crystal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crystal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: const HomePage(),
    );
  }
}
