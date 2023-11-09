import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../TyedQuestionsController/TyedQuestionsController.dart';

Future<Uint8List> makePdf() async {
  TyedQuestionsController tyedQuestionsController =
      Get.put(TyedQuestionsController(), tag: 'tyedQuestionsController');
  final font = await PdfGoogleFonts.openSansRegular();
  final pdf = pw.Document();


  pw.Widget getSignatureImage() {
    if (tyedQuestionsController.tyedAnswersModel.signatureImage != null &&
        tyedQuestionsController.tyedAnswersModel.signatureImage!.isNotEmpty) {
      return pw.Image(pw.MemoryImage(tyedQuestionsController.tyedAnswersModel.signatureImage!));
    } else {
      return pw.Text("Image not available");
    }
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.personNameQuestion
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.personNameAnswer
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.spouseNameQuestion
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.spouseNameAnswer
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.yourAddressQuestion
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.yourAddressAnswer
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.tyedDateQuestion
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                tyedQuestionsController.tyedAnswersModel.tyedDateAnswer
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              ),

              getSignatureImage()
            ]);
      },
    ),
  );
  return pdf.save();
}
