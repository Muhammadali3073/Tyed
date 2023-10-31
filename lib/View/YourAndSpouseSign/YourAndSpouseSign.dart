// // ignore_for_file: file_names
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:signature/signature.dart';
// import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
// import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
//
// import 'package:tyedapp/viewModel/YourAndSpouseSignController/YourAndSpouseSignController.dart';
//
// import '../../Widgets/CustomAppBar.dart';
// import '../../Widgets/CustomButton.dart';
//
// class YourAndSpouseSign extends StatelessWidget {
//   const YourAndSpouseSign({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final BothSignatureController controller =
//         Get.put(BothSignatureController());
//     return Scaffold(
//       backgroundColor: AppColorsConstants.SecondaryColor,
//       appBar: CustomAppBar(
//         svgImagePath: 'assets/100percent.svg',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             width: Get.width,
//             height: Get.height,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Your Signature'),
//                     InkWell(
//                       onTap: () {
//                         controller.clearYourSignature();
//                       },
//                       child: Text('clear',
//                           style: TextStyle(
//                               color: AppColorsConstants.AppMainColor)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.02,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Signature(
//                     controller: controller.yourSignatureController,
//                     height: Get.height * 0.18,
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.02,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Spouse Signature'),
//                     InkWell(
//                       onTap: () {
//                         controller.clearSpouseSignature();
//                       },
//                       child: Text('clear',
//                           style: TextStyle(
//                               color: AppColorsConstants.AppMainColor)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.02,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Signature(
//                     controller: controller.spouseSignatureController,
//                     height: Get.height * 0.18,
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.04,
//                 ),
//                 CustomElevatedButton(
//                   onpress: () {
//                     Get.toNamed(RoutesName.PaymentMethod);
//                   },
//                   text: "Done",
//                   height: Get.height * 0.05,
//                   width: Get.width * 0.4,
//                   colors: AppColorsConstants.AppMainColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
