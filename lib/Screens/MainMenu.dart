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
        backgroundColor: Colors.cyanAccent,
        title: Text('ME Downloader'),
        titleTextStyle: kTextStyle,
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('images/downloader.png'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CardButtons(
                    labeltext: "Download By URl",
                    onpress: (){
                      Navigator.pushNamed(context, URlDownloader.id);
                    },
                  ),
                )
                ,Expanded(
                  child: CardButtons(
                    labeltext: "Download By TXT",
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
                    labeltext: "Downloading Status",
                    onpress: (){
                      Navigator.pushNamed(context, DownloadingPage.id);
                    },
                  ),
                )
                ,Expanded(
                  child: CardButtons(
                    labeltext: "Downloaded Items",
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

