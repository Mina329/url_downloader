import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:downloader/Screens/MainMenu.dart';
import 'package:downloader/Screens/DownloadByURL.dart';
import 'package:downloader/Screens/DownloadedItems.dart';
import 'package:downloader/Screens/DownloadByTxt.dart';
import 'package:downloader/Screens/DownloadingPage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF111328),
        appBarTheme: AppBarTheme(
          backgroundColor:Color(0xFF0A0E21) ,
        ),
      ),
      initialRoute: MainMenu.id,
      routes: {
        MainMenu.id : (context) => MainMenu() ,
        URlDownloader.id : (context)=>URlDownloader(),
        TxtDownloader.id : (context) => TxtDownloader() ,
      },
    );
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
