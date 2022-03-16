import 'dart:isolate';
import 'dart:ui';
import 'package:downloader/constants.dart';
import 'package:flutter/material.dart';
import 'package:downloader/components/CardButton.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class URlDownloader extends StatefulWidget {
  static String id = 'URLDownloader';
  @override
  State<URlDownloader> createState() => _URlDownloaderState();
}

class _URlDownloaderState extends State<URlDownloader> {
  late String URL;
  double progress = 0;

  ReceivePort _receivePort = ReceivePort();
  static downloadingCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloading');
    send!.send([id, status, progress]);
  }

  showAlertDialog(BuildContext context, String title, String Message) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: kTextStyle,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "$title",
        style: kTextStyle,
      ),
      content: Text(
        "$Message",
        style: kTextStyle,
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloading');
    _receivePort.listen((dynamic data) {
      setState(() {
        String id = data[0];
        DownloadTaskStatus status = data[1];
        progress = data[2];
      });
    });
    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Download by URl',
          style: kTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter URl',
              ),
              onChanged: (value) {
                URL = value;
              },
            ),
          ),
          CardButtons(
            labeltext: 'Start Downloading',
            onpress: () async {
              final status = await Permission.storage.request();
              if (status.isGranted) {
                showAlertDialog(context, 'Successful', 'Download Started');
                final id = await FlutterDownloader.enqueue(
                    url: URL,
                    savedDir: '/storage/emulated/0/Download',
                    showNotification: true,
                    openFileFromNotification: true);
              } else {
                showAlertDialog(context, 'Error', 'Permission Denied');
              }
            },
            height: 60.0,
            width: 300.0,
          )
        ],
      ),
    );
  }
}
