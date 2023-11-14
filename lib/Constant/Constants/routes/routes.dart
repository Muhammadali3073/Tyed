import 'package:get/get.dart';
import 'package:tyedapp/View/AddPeopleScreen/AddPeopleScreen.dart';
import 'package:tyedapp/View/AgreementScreen/AgreementScreen.dart';
import 'package:tyedapp/View/AssetsScreen/AssetsScreen.dart';

import 'package:tyedapp/View/CardInfo/CardInfo.dart';
import 'package:tyedapp/View/ChangePasscode/ChangePasscode.dart';

import 'package:tyedapp/View/CommitmentScreen/CommitmentMilestons.dart';
import 'package:tyedapp/View/ContactListScreen/ContactListScreen.dart';
import 'package:tyedapp/View/DownloadScreen/DownloadScreen.dart';
import 'package:tyedapp/View/ProfileScreen/ProfileScreen.dart';
import 'package:tyedapp/View/FamilyDocumentCheckout/FamilyDocChececkout.dart';
import 'package:tyedapp/View/InheritanceScreen/InheritScreen.dart';
import 'package:tyedapp/View/PaySpousal/PaySpousal.dart';
import 'package:tyedapp/View/PayingScreen/PayingScreen.dart';
import 'package:tyedapp/View/PaymentMethod/PaymentMethod.dart';
import 'package:tyedapp/View/PdfViewer/PdfViewer.dart';
import 'package:tyedapp/View/PersonDetail/PersonDetail.dart';
import 'package:tyedapp/View/PrivacyPolicyScreen/PrivacyPolicyScreen.dart';
import 'package:tyedapp/View/EditProfile/EditProfileScreen.dart';
import 'package:tyedapp/View/SaveDocumentsScreen/SaveDocumentsScreen.dart';
import 'package:tyedapp/View/SelectCategory/SelectCategory.dart';
import 'package:tyedapp/View/ShareDocumentsScreen/ShareDocumentsScreen.dart';
import 'package:tyedapp/View/Signup/SignUpScreen.dart';
import 'package:tyedapp/View/YouTiedAgreement/YourTiedAgreement.dart';
import 'package:tyedapp/View/YourPasscode/yourPasscode.dart';
import '../../../View/AddFamilyDocumentsFolder/AddFamilyDocumentsFolder.dart';
import '../../../View/DocumentsFolder/DocumentsFolder.dart';
import '../../../View/InsurancePdfdocImages/InsurancePdfdocImages.dart';
import '../../../View/MainScreen/MainScreen.dart';
import '../../../View/Onboardscreen/OnboardScreen.dart';
import '../../../View/PdfViewer/NetworkPDFViewer.dart';
import '../../../View/Signin/SignInScreen.dart';
import '../../../View/YesNoScreen2/YesNoScreen2.dart';
import '../../../View/YesNoScreen3/YesNoScreen3.dart';
import '../../../View/YesNoScreen4/YesNoScreen4.dart';
import '../../../View/YesNoScreen5/YesNoScreen5.dart';
import '../../../View/YesNoScreens/YesNo1.dart';
import '../../../View/YourAndSpouseSign/YourAndSpouseSign.dart';
import '../../../Widgets/BottomNavBar.dart';
import 'routesName.dart';

dynamic arguments;

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesName.CustomBottomNavigationBar,
      page: () => CustomBottomNavigationBar(),
    ),
    GetPage(
      name: RoutesName.OnboardScreen,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: RoutesName.SignIn,
      page: () => SignInScreen(),
    ),
    GetPage(name: RoutesName.Signup, page: () => SignUpScreen()),
    GetPage(name: RoutesName.MainScreen, page: () => MainScreen()),
    GetPage(
        name: RoutesName.CommitmentMilestone,
        page: () => CommitmentMilestone()),
    GetPage(name: RoutesName.PersonDetails, page: () => PersonDetails()),
    GetPage(name: RoutesName.DocumentsFolder, page: () => DocumentsFolder()),
    GetPage(
        name: RoutesName.AssetsScreen,
        page: () => AssetsScreen(),
        arguments: arguments),
    GetPage(name: RoutesName.YesNoScreen, page: () => YesNoScreen()),
    GetPage(name: RoutesName.PayingScreen, page: () => PayingScreen()),
    GetPage(name: RoutesName.YesNoScreen2, page: () => YesNoScreen2()),
    GetPage(name: RoutesName.YesNoScreen3, page: () => YesNoScreen3()),
    GetPage(name: RoutesName.YesNoScreen4, page: () => YesNoScreen4()),
    GetPage(name: RoutesName.YesNoScreen5, page: () => YesNoScreen5()),
    GetPage(name: RoutesName.PaySpousal, page: () => PaySpousal()),
    GetPage(
        name: RoutesName.Insurancepdfdocimages,
        page: () => Insurancepdfdocimages(),
        arguments: arguments),
    GetPage(name: RoutesName.InheritScreen, page: () => InheritScreen()),
    GetPage(name: RoutesName.AgreementScreen, page: () => AgreementScreen()),
    GetPage(
        name: RoutesName.FamilyDocumentsFolder,
        page: () => FamilyDocumentsFolder(),arguments: arguments),

    GetPage(
        name: RoutesName.PaymentMethod,
        page: () => PaymentMethod(),
        arguments: arguments),
    GetPage(
        name: RoutesName.PaymentMethodProcess,
        page: () => PaymentMethodProcess(),
        arguments: arguments),
    GetPage(name: RoutesName.DownloadScreen, page: () => DownloadScreen()),
    // GetPage(name: RoutesName.BrowseFiles, page: () => BrowseFiles()),
    GetPage(
        name: RoutesName.FamilyDocCheckout, page: () => FamilyDocCheckout()),
    GetPage(name: RoutesName.SelectCategory, page: () => SelectCategory()),
    GetPage(
        name: RoutesName.AddPeopleScreen,
        page: () => AddPeopleScreen(),
        arguments: arguments),
    GetPage(
        name: RoutesName.ContactListScreen, page: () => ContactListScreen()),
    GetPage(
        name: RoutesName.ShareDocumentsScreen,
        page: () => ShareDocumentsScreen()),
    GetPage(name: RoutesName.YourPasscode, page: () => YourPasscode()),
    GetPage(
        name: RoutesName.SavedDocumentsScreen,
        page: () => SavedDocumentsScreen()),
    GetPage(name: RoutesName.PdfViewer, page: () => PdfViewer()),
    GetPage(
        name: RoutesName.NetworkPdfViewer,
        page: () => NetworkPdfViewer(),
        arguments: arguments),
    GetPage(name: RoutesName.ChangePasscode, page: () => ChangePasscode()),
    GetPage(
        name: RoutesName.YourTiedAgreement, page: () => YourTiedAgreement()),
    GetPage(name: RoutesName.ProfileScreen, page: () => EditProfile()),
    GetPage(name: RoutesName.EditProfile, page: () => ProfileScreen()),
    GetPage(
        name: RoutesName.YourAndSpouseSign, page: () => YourAndSpouseSign()),
    GetPage(
        name: RoutesName.PrivacyPolicyScreen,
        page: () => PrivacyPolicyScreen()),
  ];
}
