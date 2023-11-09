// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import '../../viewModel/TextToPDFController/text-to_pdf_controller.dart';

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
                  await Printing.sharePdf(
                    bytes: await makePdf(),
                  );
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ))
          ],
          title:
          const Text('PDF Screen', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: PdfPreview(
        build: (context) => makePdf(),
        allowPrinting: false,
        allowSharing: false,
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        scrollViewDecoration: const BoxDecoration(color: Colors.white),
        pdfPreviewPageDecoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 0.0),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
