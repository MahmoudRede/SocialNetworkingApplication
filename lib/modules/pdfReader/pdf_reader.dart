import 'dart:isolate';
import 'dart:ui';
import 'package:final_project/constants/componts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class PdfReader extends StatefulWidget {
  final String pdfUrl;
  final String title;
  const PdfReader({Key? key , required this.pdfUrl , required this.title}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}



class _PdfReaderState extends State<PdfReader> {

  Future dwonlaodFile (String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();

      await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    }
  }


  final ReceivePort _port = ReceivePort();

  @override
  void initState() {

    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if(status == DownloadTaskStatus.complete)
        {
          print("pdf downloaded successful");
        }
      setState((){ });
    });

    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                dwonlaodFile(widget.pdfUrl).then((value){
                  customToast('Download Successful', Colors.green);
                });
              },
              icon: const Icon(
              Icons.download,
              color: Colors.black,
          )),
        ],
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
      ),
    );
  }



}


