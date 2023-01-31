import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelWelcome;
  String get lngName;
  String get labelInfo;
  String get labelChangeLanguage;
  String get labelSelectLanguage;

  String get labelHello;
  String get labelBal;
  String get homeJob;
  String get homeProject;
  String get homeQuotation;
  String get homeInvoice;
  String get homeLabour;
  String get homeMaterial;
  String get homeClient;
  String get homeLegal;
  String get homeAccount;
  String get homeMenu;
  String get homeEnquiry;
  String get homeTutorial;
  String get homeNotification;

}
