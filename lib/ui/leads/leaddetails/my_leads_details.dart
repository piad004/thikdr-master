import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thikdr/ui/estimate/estimate.dart';
import 'package:thikdr/ui/leads/leaddetails/model/lead_details_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../network/webservice.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/pref_utils.dart';
import '../../../utils/progress_dialog_utils.dart';
import 'dart:io' show Platform;

class MyLeadDetailsPage extends StatefulWidget {
  //Details leadDetails;
  String id;

  MyLeadDetailsPage(this.id);

  @override
  State<MyLeadDetailsPage> createState() => _MyLeadDetailsState();
}

class _MyLeadDetailsState extends State<MyLeadDetailsPage> {
  Details leadDetails = Details();
  var cashfreePaymentStatus = "";
  var referenceId = "";

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    } else {
      ProgressDialogUtils().progressDialogue(context);
      getLatestLeadsDetails();
    }
  }

  Future<void> getLatestLeadsDetails() async {
    try {
      var token = await PrefUtils().getPreferencesData("token");

      var leadModel =
          await Webservice().requestLeadsDetails(token.toString(), widget.id);

      if (!leadModel.error!) {
        setState(() {
          leadDetails = leadModel.data!.details!;
        });
      }

      print('response lead details : ${jsonEncode(leadModel)}');
      ProgressDialogUtils().hideProgressDialog(context,mounted);
    } catch (e) {
      ProgressDialogUtils().hideProgressDialog(context,mounted);
      showMsg(e.toString());
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.red900,
                ColorConstant.deepOrange400De,
              ],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "My Lead Details".toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle.textstylerobotobold20.copyWith(
            fontSize: getFontSize(
              20,
            ),
            height: 0.80,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: 
      SingleChildScrollView(
        padding: EdgeInsets.only(
          top: getVerticalSize(
            20.00,
          ),
          bottom: getVerticalSize(
            10.00,
          ),
          left: getHorizontalSize(
            15.00,
          ),
          right: getHorizontalSize(
            15.00,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(
                    0.008,
                    0.029,
                  ),
                  end: Alignment(
                   1,
                   1,
                  ),
                  colors: [
                    ColorConstant.red900,
                    ColorConstant.deepOrange400De,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.only(
                        top: getVerticalSize(
                          18.00,
                        ),
                        bottom: getVerticalSize(
                          14.00,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            20.00,
                          ),
                          right: getHorizontalSize(
                            135.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: getSize(
                                20.00,
                              ),
                              width: getSize(
                                20.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgVector73,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  95.00,
                                ),
                                top: getVerticalSize(
                                  3.00,
                                ),
                                bottom: getVerticalSize(
                                  1.00,
                                ),
                              ),
                              child: Text(
                                "lbl_leads_deatils".toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                AppStyle.textstylerobotobold20.copyWith(
                                  fontSize: getFontSize(
                                    20,
                                  ),
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      1.00,
                    ),
                    right: getHorizontalSize(
                      3.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        10.00,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.gray400A8,
                        spreadRadius: getHorizontalSize(
                          2.00,
                        ),
                        blurRadius: getHorizontalSize(
                          2.00,
                        ),
                        offset: Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            12.00,
                          ),
                          top: getVerticalSize(
                            12.00,
                          ),
                          right: getHorizontalSize(
                            12.00,
                          ),
                        ),
                        child: Text(
                          "Buyer Details",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanbold122.copyWith(
                            fontSize: getFontSize(
                              15,
                            ),
                            height: 0.83,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            14.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  12.00,
                                ),
                                top: getVerticalSize(
                                  1.00,
                                ),
                                bottom: getVerticalSize(
                                  4.00,
                                ),
                              ),
                              child: Text(
                                (leadDetails.user != null)
                                    ?  leadDetails.user.toString()
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.textstylerobotobold12.copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  20.00,
                                ),
                                decoration: AppDecoration
                                    .textstylerobotoromanregular1013,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(8),
                                      right: getHorizontalSize(8)),
                                  child: Text(
                                    (leadDetails.leadStatus != null)
                                        ?  leadDetails.leadStatus.toString()
                                        : "",
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstylerobotoromanregular1013
                                        .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            13.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  11.00,
                                ),
                              ),
                              child: Text(
                                (leadDetails.address != null)
                                    ?  leadDetails.address.toString()
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanregular128
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.42,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  11.00,
                                ),
                              ),
                              child: Text(
                                (leadDetails.phone != null)
                                    ?  leadDetails.phone.toString()
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanregular128
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.42,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              11.00,
                            ),
                            top: getVerticalSize(
                              17.00,
                            ),
                            right: getHorizontalSize(
                              11.00,
                            ),
                            bottom: getVerticalSize(
                              13.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                (leadDetails.postDate != null)
                                    ? "Estmd start date : \n" +
                                    leadDetails.postDate.toString()
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanregular128
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.42,
                                ),
                              ),
                              Text(
                                (leadDetails.userEmail != null)
                                    ? leadDetails.userEmail.toString()
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanregular128
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.42,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    30.00,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          15.00,
                        ),
                        top: getVerticalSize(
                          11.00,
                        ),
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      decoration: AppDecoration.textstylerobotoromanbold125,
                      child: Text(
                        "Requirements",
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.textstylerobotoromanbold125.copyWith(
                          fontSize: getFontSize(
                            15,
                          ),
                          height: 0.83,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          10.00,
                        ),
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1016,
                      child: Text(
                        //"Category : "+"widget.leadDetails.category.toString()",
                        "Type : " + ((leadDetails.type != null)
                            ? leadDetails.type.toString()
                            : ""),
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1016
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          11.00,
                        ),
                        bottom: getVerticalSize(
                          9.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1017,
                      child: Text(
                        //"Required For : "+"widget.leadDetails.requiredFor.toString()",
                        "Job Type : " + ((leadDetails.job_type != null)
                            ? leadDetails.job_type.toString()
                            : ""),
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1017
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),
                    /*  Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          10.00,
                        ),
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1016,
                      child: Text(
                        "Role of Enquirer : "+"widget.leadDetails.roleOfEnquire.toString()",
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1016
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),*/
                    Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          11.00,
                        ),
                        bottom: getVerticalSize(
                          9.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1017,
                      child: Text(
                        "Requirement Time : " +
                           ((leadDetails.duration != null)
                            ? leadDetails.duration.toString()
                            : ""),
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1017
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),
                    /* Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          10.00,
                        ),
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1016,
                      child: Text(
                        "Quantity : "+"widget.leadDetails.qty.toString()",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1016
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),*/
                    Container(
                      /* width: getHorizontalSize(
                            WidgetsBinding
                                .instance!.window.physicalSize.width,
                          ),*/
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          12.00,
                        ),
                        top: getVerticalSize(
                          11.00,
                        ),
                        bottom: getVerticalSize(
                          9.00,
                        ),
                      ),
                      decoration:
                          AppDecoration.textstylerobotoromanregular1017,
                      child: Text(
                        //"Gross Lead Value : ₹ "+"widget.leadDetails.estmdPrice.toString()",
                        "Estmd Lead Value : ₹ " +
                            ((leadDetails.price_range != null)
                                ? leadDetails.price_range.toString()
                                : ""),
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular1017
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        WidgetsBinding.instance.window.physicalSize.width,
                      ),
                      margin: EdgeInsets.only(
                        right: getHorizontalSize(
                          2.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray101,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Expanded(
                        flex: 1,
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * 0.20,
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                12.00,
                              ),
                              top: getVerticalSize(
                                10.00,
                              ),
                              bottom: getVerticalSize(
                                26.00,
                              ),
                            ),
                            child: Text(
                              "Description :",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .textstylerobotoromanregular1014
                                  .copyWith(
                                fontSize: getFontSize(
                                  13,
                                ),
                                height: 1.00,
                              ),
                            ),
                          ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width * 0.60,
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                5.00,
                              ),
                              top: getVerticalSize(
                                8.00,
                              ),
                              right: getHorizontalSize(
                                5.00,
                              ),
                              bottom: getVerticalSize(
                                12.00,
                              ),
                            ),
                            child: Text(
                              ((leadDetails.description != null)
                                  ? leadDetails.description.toString()
                                  : ""),
                              //maxLines: 2,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .textstylerobotoromanregular1014
                                  .copyWith(
                                fontSize: getFontSize(
                                  13,
                                ),
                                height: 1.30,
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          25.00,
                        ),
                        bottom: getVerticalSize(
                          15.00,
                        ),
                        left: getHorizontalSize(
                          15.00,
                        ),
                        right: getHorizontalSize(
                          15.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              _makePhoneCall(leadDetails.phone);
                            },
                            child: Container(
                              width: size.width / 2 - 50,
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  0.00,
                                ),
                                right: getHorizontalSize(
                                  0.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
                                  ),
                                ),
                                border: Border.all(
                                  color: ColorConstant.red200,
                                  width: getHorizontalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        25.00,
                                      ),
                                      top: getVerticalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        15.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getSize(
                                        18.00,
                                      ),
                                      width: getSize(
                                        18.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgPhoneCall,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        15.00,
                                      ),
                                      top: getVerticalSize(
                                        6.00,
                                      ),
                                      right: getHorizontalSize(
                                        26.00,
                                      ),
                                      bottom: getVerticalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Call",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular1018
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        height: 1.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>{
                                _whatsapp(context, leadDetails.phone)
                            },
                            child: Container(
                              width: size.width / 2 - 50,
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
                                  ),
                                ),
                                border: Border.all(
                                  color: ColorConstant.green500,
                                  width: getHorizontalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        10.00,
                                      ),
                                      top: getVerticalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        1.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getSize(
                                        14.00,
                                      ),
                                      width: getSize(
                                        14.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgWhatsAppGreen,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        15.00,
                                      ),
                                      top: getVerticalSize(
                                        8.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        8.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Whatsapp",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular1019
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        height: 1.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          17.00,
                        ),
                        bottom: getVerticalSize(
                          15.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: size.width / 2 - 50,
                            margin: EdgeInsets.only(
                              right: getHorizontalSize(
                                15.00,
                              ),
                              left: getHorizontalSize(
                                15.00,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  5.00,
                                ),
                              ),
                              border: Border.all(
                                color: ColorConstant.lightBlue200,
                                width: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      9.00,
                                    ),
                                    top: getVerticalSize(
                                      14.00,
                                    ),
                                    bottom: getVerticalSize(
                                      14.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Lead Status",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstylerobotoromanregular1020
                                        .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      color: ColorConstant.lightBlue200,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      15.00,
                                    ),
                                    top: getVerticalSize(
                                      10.00,
                                    ),
                                    right: getHorizontalSize(
                                      10.00,
                                    ),
                                    bottom: getVerticalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      9.00,
                                    ),
                                    width: getHorizontalSize(
                                      9.00,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgArrowDown,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstimatePage()));
                            },
                            child: Container(
                              width: size.width / 2 - 50,
                              margin: EdgeInsets.only(
                                right: getHorizontalSize(
                                  20.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
                                  ),
                                ),
                                border: Border.all(
                                  color: ColorConstant.deepOrange400,
                                  width: getHorizontalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        9.00,
                                      ),
                                      top: getVerticalSize(
                                        15.00,
                                      ),
                                      bottom: getVerticalSize(
                                        15.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Send Proposal",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular1020
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        color: ColorConstant.deepOrange400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        15.00,
                                      ),
                                      top: getVerticalSize(
                                        10.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        9.00,
                                      ),
                                      width: getHorizontalSize(
                                        9.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgRightArrow,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EstimatePage()));
                      },
                      child: Container(
                        width: getHorizontalSize(
                          WidgetsBinding
                              .instance!.window.physicalSize.width,
                        ),
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            1.00,
                          ),
                          top: getVerticalSize(
                            100.00,
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            15.00,
                          ),
                          bottom: getVerticalSize(
                            15.00,
                          ),
                        ),
                        decoration:
                            AppDecoration.textstylerobotoromanbold13,
                        child: Text(
                          "Buy lead for 118 Price".toUpperCase(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style:
                              AppStyle.textstylerobotoromanbold13.copyWith(
                            fontSize: getFontSize(
                              15,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _whatsapp(BuildContext context, String contact) async {
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('WhatsApp is not installed.'),
      ));
    }
  }
}
