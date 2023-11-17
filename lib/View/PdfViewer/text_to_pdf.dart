import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

Future<Uint8List> makePdf() async {
  TyedQuestionsController tyedQuestionsController =
      Get.put(TyedQuestionsController(), tag: 'tyedQuestionsController');
  // final font = await PdfGoogleFonts.openSansRegular();
  final pdf = pw.Document();

  pw.Widget spouseSignatureImage() {
    if (tyedQuestionsController.tyedAnswersModel.spouseSignatureImage != null &&
        tyedQuestionsController
            .tyedAnswersModel.spouseSignatureImage!.isNotEmpty) {
      return pw.Image(pw.MemoryImage(
          tyedQuestionsController.tyedAnswersModel.spouseSignatureImage!));
    } else {
      return pw.Text("");
    }
  }

  pw.Widget personSignatureImage() {
    if (tyedQuestionsController.tyedAnswersModel.personSignatureImage != null &&
        tyedQuestionsController
            .tyedAnswersModel.personSignatureImage!.isNotEmpty) {
      return pw.Image(pw.MemoryImage(
          tyedQuestionsController.tyedAnswersModel.personSignatureImage!));
    } else {
      return pw.Text("");
    }
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.standard,
      build: (pw.Context context) {
        return [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
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
            pw.SizedBox(
              height: 10,
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
            pw.SizedBox(
              height: 10,
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
            pw.SizedBox(
              height: 10,
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
            pw.SizedBox(
              height: 10,
            ),
            tyedQuestionsController.tyedAnswersModel.assetsBelongOnlyYouAnswer
                    .toString()
                    .isNotEmpty
                ? pw.Text(
                    tyedQuestionsController
                        .tyedAnswersModel.assetsBelongOnlyYouQuestion
                        .toString(),
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  )
                : pw.Container(),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.assetsBelongOnlyYouAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.coOwnAssetsQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.coOwnAssetsAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            tyedQuestionsController.tyedAnswersModel.responsibleForPayingAnswer
                    .toString()
                    .isNotEmpty
                ? pw.Text(
                    tyedQuestionsController
                        .tyedAnswersModel.responsibleForPayingQuestion
                        .toString(),
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  )
                : pw.Container(),
            pw.Text(
              tyedQuestionsController
                  .tyedAnswersModel.responsibleForPayingAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.jointCreditCardQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.jointCreditCardAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.haveChildrenQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.haveChildrenAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.havePetQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.havePetAnswer.toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.liveTogetherQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.liveTogetherAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.tyedEndsQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.tyedEndsAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.spousalSupportQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.spousalSupportAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController
                  .tyedAnswersModel.spousalSupportEndsQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.spousalSupportEndsAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.youPassedQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.youPassedAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController
                  .tyedAnswersModel.anythingElseIncludeQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.anythingElseIncludeAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.likeToAddQuestion
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              tyedQuestionsController.tyedAnswersModel.likeToAddAnswer
                  .toString(),
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 40,
            ),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.SizedBox(
                    height: 70,
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Person Signature',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 40,
                            child: personSignatureImage(),
                          ),
                        ]),
                  ),
                  pw.SizedBox(
                    height: 70,
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Spouse\'s Signature',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 40,
                            child: spouseSignatureImage(),
                          ),
                        ]),
                  ),
                ])
          ])
        ];
      },
    ),
  );

  return pdf.save();
}
