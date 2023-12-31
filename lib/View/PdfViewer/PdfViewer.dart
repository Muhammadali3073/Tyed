// ignore_for_file: library_private_types_in_public_api


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  _PdfVierState createState() => _PdfVierState();
}

class _PdfVierState extends State<PdfViewer> {


  File? file;

  Future<File?> fileFromImageUrl() async {
    final response = await http.get(Uri.parse(Get.arguments.toString()));

    final documentDirectory = await getApplicationDocumentsDirectory();

    file = File(join(documentDirectory.path, 'Tyed Agreement.pdf'));

    file!.writeAsBytesSync(response.bodyBytes);

    log(file!.path.toString());
    return file;
  }

  @override
  void initState() {
    // TODO: implement initState
    fileFromImageUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15))),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                  onPressed: () async {
                    final result = await Share.shareXFiles([XFile(file!.path)]);

                    if (result.status == ShareResultStatus.success) {
                      log('Thank you for sharing Tyed Agreement!');
                    }
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ))
            ],
            title:
            const Text('PDF Screen', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white),
        body: SfPdfViewer.network(
          Get.arguments.toString(),
          enableTextSelection: false,
        ));
  }
}
