import 'package:flutter/material.dart';
import 'package:oct_10_2023/screens/todo_screen.dart';

void main(){
  runApp(LabWork());
}

class LabWork extends StatefulWidget {
  LabWork({super.key});

  @override
  State<LabWork> createState() => _LabWorkState();
}

class _LabWorkState extends State<LabWork> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}