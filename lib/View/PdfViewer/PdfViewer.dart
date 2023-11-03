// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../Widgets/CustomAppbar2.dart';




class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  _PdfVierState createState() => _PdfVierState();
}

class _PdfVierState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar2(
            height:  Get.height * 0.10,
            titleText: "Document 1",
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Expanded(child: SfPdfViewer.asset('assets/sample.pdf')),
        ],
      ),
    );
  }
}
