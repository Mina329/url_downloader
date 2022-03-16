import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:downloader/components/CardButton.dart';
import 'package:downloader/Screens/DownloadByURL.dart';
import 'package:downloader/Screens/DownloadByTxt.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


class MainMenu extends StatefulWidget {
  static String id = 'MainMenu';
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ME Downloader'),
        titleTextStyle: kTextStyle,
        centerTitle: true,
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image.asset('images/downloader.png'),
          Center(
            child: Icon(
              Icons.download_rounded,
              size: 350.0,
              color: Colors.white70,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CardButtons(
                    height: 120.0,
                    width: 200.0,
                    labeltext: "Download \n   By URl",
                    onpress: (){
                      Navigator.pushNamed(context, URlDownloader.id);
                    },
                  ),
                )
                ,Expanded(
                  child: CardButtons(
                    height: 120.0,
                    width: 200.0,
                    labeltext: "Download \n    By txt",
                    onpress: (){
                      Navigator.pushNamed(context, TxtDownloader.id);
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

