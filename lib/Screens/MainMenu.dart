import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:downloader/components/CardButton.dart';
import 'package:downloader/Screens/DownloadByURL.dart';
import 'package:downloader/Screens/DownloadByTxt.dart';
import 'package:downloader/Screens/DownloadingPage.dart';
import 'package:downloader/Screens/DownloadedItems.dart';

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
        backgroundColor: Color(0xFF0A0E21),
        title: Text('ME Downloader'),
        titleTextStyle: kTextStyle,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF111328),
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
                    labeltext: "Download \n   By URl",
                    onpress: (){
                      Navigator.pushNamed(context, URlDownloader.id);
                    },
                  ),
                )
                ,Expanded(
                  child: CardButtons(
                    labeltext: "Download \n    By txt",
                    onpress: (){
                      Navigator.pushNamed(context, TxtDownloader.id);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CardButtons(
                    labeltext: "Downloading \n      Status",
                    onpress: (){
                      Navigator.pushNamed(context, DownloadingPage.id);
                    },
                  ),
                )
                ,Expanded(
                  child: CardButtons(
                    labeltext: "Downloaded \n      Items",
                    onpress: (){
                      Navigator.pushNamed(context, DownloadedItems.id);
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

