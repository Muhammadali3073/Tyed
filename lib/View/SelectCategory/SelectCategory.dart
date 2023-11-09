import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/View/InsurancePdfdocImages/InsurancePdfdocImages.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';

class SelectCategory extends StatelessWidget {
  // Track the selected option
  final RxString selectedRadio = "Insurance".obs;
  final RxList<String> options = [
    "Insurance",
    "Bank Statement",
    "Tax Reports",
    "Bills",
    "Retirement Plans",
    "Personal",
    "Business",
    "Passwords",
    "Others",
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar2(
            height: Get.height * 0.1,
            titleText: 'Select Category',
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          SizedBox(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Obx(() => Row(
                            children: [
                              Radio(
                                activeColor: AppColorsConstants.AppMainColor,
                                value: options[index],
                                groupValue: selectedRadio.value,
                                onChanged: (value) {
                                  selectedRadio.value = value!;
                                },
                              ),
                              Text(options[index]),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          CustomElevatedButton(
            onpress: () {
              Get.toNamed(RoutesName.Insurancepdfdocimages,
                  arguments: selectedRadio.value);
            },
            text: "Next",
            height: Get.height * 0.05,
            width: Get.width * 0.4,
            colors: AppColorsConstants.AppMainColor,
          ),
        ],
      ),
    );
  }
}
