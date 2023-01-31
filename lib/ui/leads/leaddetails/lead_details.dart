import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thikdr/ui/leads/leaddetails/model/lead_details_model.dart';
import 'package:thikdr/ui/leads/leaddetails/model/lead_model.dart';
import 'package:thikdr/ui/leads/leaddetails/my_leads_details.dart';

import '../../../network/webservice.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/pref_utils.dart';
import '../../../utils/progress_dialog_utils.dart';

class LeadDetailsPage extends StatefulWidget {
  String id;

  LeadDetailsPage(this.id);

  @override
  State<LeadDetailsPage> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetailsPage> {
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
          "Lead Details".toUpperCase(),
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
      body: Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                        ? leadDetails.user.toString()
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
                                            ? leadDetails.leadStatus.toString()
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
                                        ? (leadDetails.address
                                                    .toString()
                                                    .length >
                                                15)
                                            ? "*******" +
                                                leadDetails.address
                                                    .toString()
                                                    .substring(
                                                        (leadDetails.address
                                                                .toString()
                                                                .length) -
                                                            14,
                                                        leadDetails.address
                                                            .toString()
                                                            .length)
                                            : "*******" +
                                                leadDetails.address.toString()
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
                                        ? ((leadDetails.phone
                                                    .toString()
                                                    .length >
                                                4)
                                            ? leadDetails.phone
                                                    .toString()
                                                    .substring(0, 3) +
                                                "*******"
                                            : leadDetails.phone.toString() +
                                                "*******")
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
                                        ? ((leadDetails.userEmail
                                                    .toString()
                                                    .length >
                                                4)
                                            ? leadDetails.userEmail
                                                    .toString()
                                                    .substring(0, 3) +
                                                "*******"
                                            : (leadDetails.userEmail.toString().isEmpty)?"":
                                    leadDetails.userEmail.toString()+
                                                "*******")
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
                            "Type : " +
                                ((leadDetails.type != null)
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
                            "Job Type : " +
                                ((leadDetails.job_type != null)
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
                            "Role of Enquirer : " +
                                ((leadDetails.roleOfEnquire != null)
                                    ? leadDetails.roleOfEnquire.toString()
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
                            "Quantity : " +
                                ((leadDetails.qty != null)
                                    ? leadDetails.qty.toString()
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
                            //"Gross Lead Value : ₹ " +
                            "Estmd Lead Value : ₹ " +
                                ((leadDetails.price_range != null)
                                    ? leadDetails.price_range.toString()
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
                                    // maxLines: 2,
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
                        if(leadDetails.buy_status != null && leadDetails.buy_status != 1)
                        InkWell(
                          onTap: () {
                            makePayment();
                          },
                          child: Container(
                            width: getHorizontalSize(
                              WidgetsBinding.instance.window.physicalSize.width,
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
                              "Buy lead for ₹ " +
                                  ((leadDetails.buy_price != null)
                                      ? leadDetails.buy_price.toString()
                                      : "0"),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // WEB Intent
  makePayment() async {
    //Replace with actual values
    String orderId = leadDetails.orderId.toString();
    String stage = "TEST";
    //String orderAmount = "ORDER_AMOUNT";
    String orderAmount =  ((leadDetails.buy_price != null)
        ? leadDetails.buy_price.toString()
        : "0");
    String tokenData = leadDetails.orderToken.toString();
    String customerName = leadDetails.user.toString();
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "421848c7cae63ad8d1091397b48124";
    String customerPhone =
        (leadDetails.phone != null && leadDetails.phone.toString().isNotEmpty)
            ? leadDetails.phone.toString()
            : "9000000000";
    String customerEmail = (leadDetails.userEmail != null &&
            leadDetails.userEmail.toString().isNotEmpty)
        ? leadDetails.userEmail.toString()
        : "sample@abc.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doPayment(inputParams).then((value) => {
          value?.forEach((key, value) {
            print("$key : $value");
            //Do something with the result
            if (key == "referenceId") {
              referenceId = value;
            }
            if (key == "txStatus") {
              cashfreePaymentStatus = value;
            }
          }),
          print("status $referenceId : $cashfreePaymentStatus"),
          if (cashfreePaymentStatus == "SUCCESS") {buyLeads(referenceId)},
        });
  }

  void buyLeads(var referenceId) async {
    if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    } else {
      getRequestBuyLeads(referenceId);
    }
  }

  Future<void> getRequestBuyLeads(var trnId) async {
    try {
      var token = await PrefUtils().getPreferencesData("token");

      var leadModel = await Webservice().requestBuyLeads(token.toString(), "",
          widget.id, trnId.toString(), leadDetails.estmdPrice.toString(), "");

      if (!leadModel.error) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    //MyLeadDetailsPage(leadDetails as LeadList)));
                    MyLeadDetailsPage(leadDetails.id.toString())));
      }
      showMsg(leadModel.message);

      print('buy leads response : ${jsonEncode(leadModel)}');
    } catch (e) {
      showMsg(e.toString());
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
