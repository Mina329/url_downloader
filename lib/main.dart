import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}


// class MyAppScreenState extends State<MyAppScreen> {
//   List<String> _questions = [];
//
//   Future<List<String>> _loadQuestions() async {
//     List<String> questions = [];
//     await rootBundle.loadString('path/to/questions.txt').then((q) {
//       for (String i in LineSplitter().convert(q)) {
//         questions.add(i);
//       }
//     });
//     return questions;
//   }
