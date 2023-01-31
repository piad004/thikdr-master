import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/materiallibrary/addmaterial/add_used_material_page.dart';
import 'package:thikdr/ui/materiallibrary/receivedmaterial/add_received_material_page.dart';
import 'package:thikdr/ui/projectsummary/payment/models/payment_item_model.dart';
import 'package:thikdr/ui/projectsummary/payment/paidpayment/received_payment_page.dart';
import 'package:thikdr/ui/projectsummary/payment/receivedpayment/received_payment_page.dart';
import 'package:thikdr/ui/projectsummary/payment/widgets/payment_item_widget.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentState();
}

class _PaymentState extends State<PaymentPage> {
  final List<PaymentItemModel> _list = [
    PaymentItemModel(''),
    PaymentItemModel(''),
    PaymentItemModel(''),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        SingleChildScrollView(
        child:
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*  Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      109.00,
                    ),
                    right: getHorizontalSize(
                      109.00,
                    ),
                  ),
                  child: Container(
                    height: getSize(
                      16.00,
                    ),
                    width: getSize(
                      16.00,
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.imgBiglobe3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),*/
              /*Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      68.12,
                    ),
                    right: getHorizontalSize(
                      68.12,
                    ),
                  ),
                  child: Container(
                    height: getVerticalSize(
                      5.27,
                    ),
                    width: getHorizontalSize(
                      10.05,
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.imgVector24,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),*/
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: getVerticalSize(
                    90.00,
                  ),
                  width: size.width,
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      0.00,
                    ),
                    top: getVerticalSize(
                      0,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: getVerticalSize(
                              10.00,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: getVerticalSize(
                              60.00,
                            ),
                            width: getHorizontalSize(
                              double.infinity,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  0.00,
                                ),
                              ),
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
                          ),
                          /* Image.asset(
                            ImageConstant.imgBaseBg,
                            height: getVerticalSize(
                              60.00,
                            ),
                            width: getHorizontalSize(
                              double.infinity,
                            ),
                            fit: BoxFit.fill,
                          ),*/
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              16.00,
                            ),
                            top: getVerticalSize(
                              10.00,
                            ),
                            right: getHorizontalSize(
                              16.00,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.gray5005e,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    23.00,
                                  ),
                                  top: getVerticalSize(
                                    21.00,
                                  ),
                                  bottom: getVerticalSize(
                                    20.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            6.00,
                                          ),
                                          right: getHorizontalSize(
                                            6.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Balance",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold143
                                              .copyWith(
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            height:0.80,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            6.00,
                                          ),
                                        ),
                                        child: Text(
                                          "+1,05,158",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold143
                                              .copyWith(
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            height: 1.14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: getVerticalSize(
                                  34.00,
                                ),
                                width: getHorizontalSize(
                                  1.00,
                                ),
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    31.00,
                                  ),
                                  top: getVerticalSize(
                                    23.00,
                                  ),
                                  bottom: getVerticalSize(
                                    22.00,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray300,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    31.00,
                                  ),
                                  top: getVerticalSize(
                                    21.00,
                                  ),
                                  bottom: getVerticalSize(
                                    20.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            13.00,
                                          ),
                                          right: getHorizontalSize(
                                            13.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Total In",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold144
                                              .copyWith(
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            height:0.80,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            6.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Rs. 1,20,000",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold144
                                              .copyWith(
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            height: 1.14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(flex: 1,
                                child: Container(
                                  height: getVerticalSize(
                                    34.00,
                                  ),
                                  width: getHorizontalSize(
                                    1.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      27.00,
                                    ),
                                    top: getVerticalSize(
                                      23.00,
                                    ),
                                    bottom: getVerticalSize(
                                      22.00,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    36.00,
                                  ),
                                  top: getVerticalSize(
                                    21.00,
                                  ),
                                  right: getHorizontalSize(
                                    17.00,
                                  ),
                                  bottom: getVerticalSize(
                                    20.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          5.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Total Out",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotoromanbold145
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height:0.80,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          6.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Rs. 10,000",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotoromanbold146
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 1.14,
                                        ),
                                      ),
                                    ),
                                  ],
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
              /*
              Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          20.00,
                        ),
                        width: getHorizontalSize(
                          81.00,
                        ),
                        decoration: AppDecoration.textstylerobotoromanregular142,
                        child: Text(
                          "summary",
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanregular142.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
                            height: 1.14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            7.00,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            20.00,
                          ),
                          width: getHorizontalSize(
                            79.00,
                          ),
                          decoration: AppDecoration.textstylerobotoromanregular143,
                          child: Text(
                            "payment",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular143.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            7.00,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            20.00,
                          ),
                          width: getHorizontalSize(
                            69.00,
                          ),
                          decoration: AppDecoration.textstylerobotoromanregular142,
                          child: Text(
                            "Worker",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular142.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            7.00,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            20.00,
                          ),
                          width: getHorizontalSize(
                            86.00,
                          ),
                          decoration: AppDecoration.textstylerobotoromanregular142,
                          child: Text(
                            "material",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular142.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            7.00,
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            2.00,
                          ),
                          bottom: getVerticalSize(
                            2.00,
                          ),
                        ),
                        decoration: AppDecoration.textstylerobotoromanregular142,
                        child: Text(
                          "JOB",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanregular142.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
                            height: 1.14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            7.00,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            20.00,
                          ),
                          width: getHorizontalSize(
                            63.00,
                          ),
                          decoration: AppDecoration.textstylerobotoromanregular142,
                          child: Text(
                            "Photo",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular142.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      21.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.gray102,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
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
                            5.00,
                          ),
                          top: getVerticalSize(
                            9.00,
                          ),
                          bottom: getVerticalSize(
                            9.00,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                29.00,
                              ),
                              width: getHorizontalSize(
                                28.00,
                              ),
                              decoration:
                                  AppDecoration.textstylerobotoromanregular144,
                              child: Text(
                                "1",
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular144
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  12.00,
                                ),
                                top: getVerticalSize(
                                  6.00,
                                ),
                                bottom: getVerticalSize(
                                  7.00,
                                ),
                              ),
                              child: Text(
                                "Pending for Review",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular145
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            18.00,
                          ),
                          right: getHorizontalSize(
                            16.00,
                          ),
                          bottom: getVerticalSize(
                            20.00,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            8.05,
                          ),
                          width: getHorizontalSize(
                            15.67,
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
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      15.00,
                    ),
                    top: getVerticalSize(
                      13.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.deepOrange400,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                      topRight: Radius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                      bottomLeft: Radius.circular(
                        getHorizontalSize(
                          0.00,
                        ),
                      ),
                      bottomRight: Radius.circular(
                        getHorizontalSize(
                          0.00,
                        ),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            6.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          bottom: getVerticalSize(
                            5.00,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: getVerticalSize(
                                16.00,
                              ),
                              width: getHorizontalSize(
                                26.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgHamburgerWithRedBg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  16.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  16.00,
                                ),
                                width: getHorizontalSize(
                                  119.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.deepOrange600,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "All Admin Entries",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular136
                                      .copyWith(
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    height: 0.62,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  54.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  16.00,
                                ),
                                width: getHorizontalSize(
                                  34.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.deepOrange600,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "In",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular136
                                      .copyWith(
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    height: 0.62,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            59.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          right: getHorizontalSize(
                            20.00,
                          ),
                          bottom: getVerticalSize(
                            5.00,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(
                            16.00,
                          ),
                          width: getHorizontalSize(
                            35.00,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.deepOrange600,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                20.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Out",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular136.copyWith(
                              fontSize: getFontSize(
                                13,
                              ),
                              height: 0.62,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      1.00,
                    ),
                    right: getHorizontalSize(
                      0.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.gray102,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            5.00,
                          ),
                          top: getVerticalSize(
                            10.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  6.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  18.00,
                                ),
                                width: getHorizontalSize(
                                  135.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.lightBlue50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "27 Dec from Sample user 1",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular102
                                      .copyWith(
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    height: 1.20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  2.00,
                                ),
                                top: getVerticalSize(
                                  7.00,
                                ),
                              ),
                              child: Text(
                                "Sample-1st running pay...",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.textstylerobotoromanbold122.copyWith(
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            61.00,
                          ),
                          top: getVerticalSize(
                            15.00,
                          ),
                          right: getHorizontalSize(
                            112.00,
                          ),
                          bottom: getVerticalSize(
                            13.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  1.00,
                                ),
                                right: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                              child: Text(
                                "Customer",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanbold10.copyWith(
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  letterSpacing: 1.00,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  2.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  54.00,
                                ),
                                decoration:
                                    AppDecoration.textstylerobotoromanregular81,
                                child: Text(
                                  "Rs 20,000",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular81
                                      .copyWith(
                                    fontSize: getFontSize(
                                      11,
                                    ),
                                    height: 1.50,
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
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      5.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
                    ),
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      PaymentItemModel model = _list[index];
                      return PaymentItemWidget(
                        model,
                      );
                    },
                  ),
                ),
              ),
              Divider(height: 1,color: Colors.black38,indent: 15,endIndent: 15,),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      5.00,
                    ),
                    top: getVerticalSize(
                      1.00,
                    ),

                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.gray102,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            9.00,
                          ),
                          top: getVerticalSize(
                            10.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  18.00,
                                ),
                                width: getHorizontalSize(
                                  135.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.lightBlue50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "27 Dec from Sample user 1",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular102
                                      .copyWith(
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    height: 1.20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  2.00,
                                ),
                                top: getVerticalSize(
                                  7.00,
                                ),
                              ),
                              child: Text(
                                "Sample-1st running pay...",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.textstylerobotoromanbold122.copyWith(
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            61.00,
                          ),
                          top: getVerticalSize(
                            15.00,
                          ),
                          right: getHorizontalSize(
                            112.00,
                          ),
                          bottom: getVerticalSize(
                            13.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  1.00,
                                ),
                                right: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                              child: Text(
                                "Customer",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanbold10.copyWith(
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  letterSpacing: 1.00,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  2.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  54.00,
                                ),
                                decoration:
                                    AppDecoration.textstylerobotoromanregular81,
                                child: Text(
                                  "Rs 20,000",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular81
                                      .copyWith(
                                    fontSize: getFontSize(
                                      11,
                                    ),
                                    height: 1.50,
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
              ),
            ],
          ),
    ),
        bottomSheet:
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceivedPaymentPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height:7,
                        width: 7,
                        margin: EdgeInsets.only(left: 40),
                        child: SvgPicture.asset(
                          ImageConstant.imgPlus,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            3.00,
                          ),
                          top: getVerticalSize(
                            15.00,
                          ),
                          right: 40,
                          bottom: getVerticalSize(
                            14.00,
                          ),
                        ),
                        child: Text(
                          "IN",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                          AppStyle.textstylerobotoromanbold141.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceivedPaymentPage()));
                },
                child: Container(
                  child:
                  FloatingActionButton(
                    child:
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                         40,
                        ),
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
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  /*
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green,*/
                    onPressed: () {
                      showBottomDialog();
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaidPaymentPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          top: getVerticalSize(
                            22.50,
                          ),
                          bottom: getVerticalSize(
                            21.50,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            1.00,
                          ),
                          width: getHorizontalSize(
                            8.00,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.imgMinus,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            3.00,
                          ),
                          top: getVerticalSize(
                            15.00,
                          ),
                          right: 40,
                          bottom: getVerticalSize(
                            14.00,
                          ),
                        ),
                        child: Text(
                          "OUT",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                          AppStyle.textstylerobotoromanbold141.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
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
      );
  }

  void showBottomDialog() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                  padding:
                  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddReceivedMaterialPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                             8,
                            ),
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
                                ColorConstant.yellow100,
                                ColorConstant.yellow100,
                              ],
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: SvgPicture.asset(
                                  ImageConstant.imgCar,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "Material Purchase",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular123.copyWith(
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  color: ColorConstant.yellow900,
                                  fontWeight: FontWeight.bold,
                                  height: 1.40,
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 8,
                                child: SvgPicture.asset(
                                  ImageConstant.imgRightArrow,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddUsedMaterialPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
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
                                ColorConstant.red100,
                                ColorConstant.red100,
                              ],
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 25,
                                width:25,
                                child: Image.asset(
                                  ImageConstant.imgExpense,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "Other Expense",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular123.copyWith(
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.red900,
                                  height: 1.40,
                                ),
                              ),
                              Container(
                                height: 10,
                                width:8,
                                child: SvgPicture.asset(
                                  ImageConstant.imgRightArrow,
                                  fit: BoxFit.fill,
                                  color: ColorConstant.red900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     /* Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "Party name",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        *//*width: getHorizontalSize(
                  150.00,
                ),*//*
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7, right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyNameController,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  bottom: 10,
                                  top: 5,
                                  right: 5),
                              hintText: "Party name"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "Party mobile",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        *//*width: getHorizontalSize(
                  150.00,
                ),*//*
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          maxLength: 15,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyMobileController,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 5,
                                bottom: 10,
                                top: 5,
                                right: 5),
                            hintText: "Party mobile",
                            counterText: "",),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "GST number(optional)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        *//*width: getHorizontalSize(
                  150.00,
                ),*//*
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left:8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          maxLength: 15,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyGSTController,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 5,
                                bottom: 10,
                                top: 5,
                                right: 5),
                            hintText: "GST number(optional)",
                            counterText: "",),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "State(optional)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        *//*width: getHorizontalSize(
                  150.00,
                ),*//*
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left:8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyStateController,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  bottom: 10,
                                  top: 5,
                                  right: 5),
                              hintText: "State(optional)"),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text('SAVE'),
                          onPressed: () => {
                            //Navigator.pop(context),
                            Navigator.pop(context, {
                              //'name': (_itemModel),
                              'name': partyNameController.text.toString(),
                              'mobile': partyMobileController.text.toString(),
                            }),
                            setState((){
                              customerNameController.text= partyNameController.text.toString()+", "+partyMobileController.text.toString();
                            })
                            // backToPreviousPage()
                          },
                        ),
                      ),*/
                    ],
                  )
              ));
        });
  }
}
