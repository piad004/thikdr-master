import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:thikdr/theme/app_style.dart';
import 'package:thikdr/ui/projectsummary/widgets/_LineChart.dart';
import 'package:thikdr/utils/color_constant.dart';
import 'package:thikdr/utils/image_constant.dart';

import '../../../utils/math_utils.dart';

class SummaryPage extends StatefulWidget {
  @override
  State<SummaryPage> createState() => _OngoingProjectState();
}

class _OngoingProjectState extends State<SummaryPage> {
  bool isShowingMainData = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: getVerticalSize(10),
                left: getHorizontalSize(5),
                right: getHorizontalSize(5)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          //width: getHorizontalSize(100),
                          margin: EdgeInsets.only(right: getHorizontalSize(10)),
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(10),
                              right: getHorizontalSize(10),
                              top: getVerticalSize(20),
                              bottom: getVerticalSize(20)),
                          decoration: BoxDecoration(
                            color: ColorConstant.yellow500,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              topRight: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              bottomLeft: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              bottomRight: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'TOTAL MATERIAL COST',
                                style: AppStyle.textstywhite14,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: getVerticalSize(5)),
                                child: Text(
                                  'Rs. 1,19,688',
                                  style: AppStyle.textstywhite14,
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: getVerticalSize(10)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    /*Expanded(
                                      child: Image.asset(
                                        ImageConstant.imgPlus,
                                        height: getVerticalSize(
                                          28.00,
                                        ),
                                        width: getHorizontalSize(
                                          28.00,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),*/
                                    Text(
                                      '+ Add Material',
                                      style: AppStyle
                                          .textstylerobotoromanregular1210.copyWith(color: Colors.white,fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 20),
                          decoration: BoxDecoration(
                            color: ColorConstant.blue500,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              topRight: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              bottomLeft: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              bottomRight: Radius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),
                            ),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    'TOTAL SALARY COST',
                                    style: AppStyle.textstywhite14,
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: getVerticalSize(5)),
                                  child: Text(
                                    'Rs. 1,19,688',
                                    style: AppStyle.textstywhite14,
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: getVerticalSize(10)),
                                  child: Text(
                                    'Market Attendance',
                                    style: AppStyle.textstylerobotobold141,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          height: getVerticalSize(
                            (size.width / 2) - 40,
                          ),
                          margin: EdgeInsets.only(
                            left: 2,
                            right: 4,
                            top: 15,
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
                                  1.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  1.00,
                                ),
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Center(
                                    child: CircularPercentIndicator(
                                      radius: 40.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 5.0,
                                      percent: 0.8,
                                      center: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageConstant.imgProject1,
                                              height: 17,
                                              width: 17,
                                              fit: BoxFit.fill,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: const Text(
                                                    "80%",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: ColorConstant.gray200,
                                      progressColor: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: getVerticalSize(87),
                                        left: getHorizontalSize(20),
                                        right: getHorizontalSize(20)),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        topRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 12,
                                          bottom:12),
                                      child: Text(
                                        "PROJECT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            height: 1,
                                            color: ColorConstant.whiteA700),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: getVerticalSize(
                            (size.width / 2) - 40,
                          ),
                          margin: EdgeInsets.only(
                            left: 4,
                            right:4,
                            top: 15,
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
                                  1.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  1.00,
                                ),
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Center(
                                    child: CircularPercentIndicator(
                                      radius: 40.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 5.0,
                                      percent: 0.8,
                                      center: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageConstant.imgIncome,
                                              height: 17,
                                              width: 17,
                                              fit: BoxFit.fill,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: const Text(
                                                    "80%",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: ColorConstant.gray200,
                                      progressColor: ColorConstant.red500,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: getVerticalSize(87),
                                        left: getHorizontalSize(20),
                                        right: getHorizontalSize(20)),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.red500,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        topRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 2,
                                          bottom: 4),
                                      child: Text(
                                       // "INCOME",
                                        "STOCK SUMMARY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            //height: .60,
                                            color: ColorConstant.whiteA700),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: getVerticalSize(
                            (size.width / 2) - 40,
                          ),
                          margin: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            top: 15,
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
                                  1.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  1.00,
                                ),
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Center(
                                    child: CircularPercentIndicator(
                                      radius: 40.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 5.0,
                                      percent: 0.3,
                                      center: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageConstant.imgExpense,
                                              height: 18,
                                              width:18,
                                              fit: BoxFit.fill,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: const Text(
                                                    "30%",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: ColorConstant.gray200,
                                      progressColor: ColorConstant.yellow500,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: getVerticalSize(87),
                                        left: getHorizontalSize(20),
                                        right: getHorizontalSize(20)),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.yellow500,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        topRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomLeft: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        bottomRight: Radius.circular(
                                          getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 2,
                                          bottom: 4),
                                      child: Text(
                                        //"EXPENSE",
                                        "TASK SUMMARY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12.0,
                                           // height: .60,
                                            color: ColorConstant.whiteA700),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: getVerticalSize(10)),
                    child: Container(
                      height: getVerticalSize(
                        (size.width),
                      ),
                      width: getVerticalSize(
                        double.infinity,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          4.00,
                        ),
                        right: getHorizontalSize(
                          4.00,
                        ),
                        top: getVerticalSize(
                          10.00,
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
                              1.00,
                            ),
                            blurRadius: getHorizontalSize(
                              1.00,
                            ),
                            offset: const Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(bottom: getVerticalSize(15)),
                            child: Text(
                              "Payment",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    20,
                                  ),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: getVerticalSize(15),
                                bottom: getVerticalSize(15)),
                            child: CircularPercentIndicator(
                              radius: 90.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 25.0,
                              percent: 0.3,
                              center: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "TOTAL",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppStyle.textstylerobotoromanbold16,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "INR 20L",
                                      textAlign: TextAlign.center,
                                      style: AppStyle.textstyleregular20,
                                    ),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: ColorConstant.red500,
                              progressColor: ColorConstant.yellow500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: getHorizontalSize(100),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: getVerticalSize(7),
                                    left: getHorizontalSize(10),
                                    right: getHorizontalSize(10)),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Payment In",
                                  style: AppStyle.textstylerobotobold14,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(100),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: getVerticalSize(10),
                                    left: getHorizontalSize(10),
                                    right: getHorizontalSize(10)),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Payment Out",
                                  style: AppStyle.textstylerobotobold14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: getHorizontalSize(100),
                                height: getVerticalSize(15),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: getVerticalSize(2),
                                    left: getHorizontalSize(10),
                                    right: getHorizontalSize(10)),
                                decoration: BoxDecoration(
                                  color: ColorConstant.red500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(100),
                                height: getVerticalSize(15),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: getVerticalSize(2),
                                    left: getHorizontalSize(10),
                                    right: getHorizontalSize(10)),
                                decoration: BoxDecoration(
                                  color: ColorConstant.yellow500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                          ),
                          child: Text(
                           // "Task Square Feet",
                            "Income/Expense",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left:5,
                                    right: 5),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "70%",
                                  style: AppStyle.textstylerobotobold14,
                                ),
                              ),
                              Container(
                                height: 10,
                                width:(MediaQuery.of(context).size.width)/1.4,
                                decoration: BoxDecoration(
                                  color: ColorConstant.red500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: 10,
                                    left:5,
                                    right: 5),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "40%",
                                  style: AppStyle.textstylerobotobold14,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 10,
                                width:(MediaQuery.of(context).size.width)/2,
                                decoration: BoxDecoration(
                                  color: ColorConstant.yellow500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: getHorizontalSize(100),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: getVerticalSize(7),
                                      left: getHorizontalSize(10),
                                      right: getHorizontalSize(10)),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      topRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Income",
                                    style: AppStyle.textstylerobotobold14,
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(100),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: getVerticalSize(10),
                                      left: getHorizontalSize(10),
                                      right: getHorizontalSize(10)),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      topRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Expense",
                                    style: AppStyle.textstylerobotobold14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: 2,
                                      left: 8,
                                      right: 8,
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red500,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      topRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: 2,
                                      left: 8,
                                      right: 8,
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.yellow500,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      topRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomLeft: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      bottomRight: Radius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         /* Expanded(
                            child: Container(
                              height: getVerticalSize(
                                (size.width / 2),
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  5.00,
                                ),
                                top: getVerticalSize(
                                  17.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
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
                                      1.00,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      1.00,
                                    ),
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Center(
                                        child: CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 5.0,
                                          percent: 0.8,
                                          center: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: const Text(
                                                        "80%",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                          backgroundColor:
                                              ColorConstant.gray200,
                                          progressColor: Colors.lightBlueAccent,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: getVerticalSize(77),
                                            left: getHorizontalSize(20),
                                            right: getHorizontalSize(20)),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            topRight: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            bottomLeft: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            bottomRight: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: getVerticalSize(9),
                                              bottom: getVerticalSize(7)),
                                          child: Text(
                                            "STOCK SUMMARY",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                height: .60,
                                                color: ColorConstant.whiteA700),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: getVerticalSize(
                                (size.width / 2),
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  10.00,
                                ),
                                top: getVerticalSize(
                                  17.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
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
                                      1.00,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      1.00,
                                    ),
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Center(
                                        child: CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 5.0,
                                          percent: 0.8,
                                          center: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: const Text(
                                                        "80%",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                          backgroundColor:
                                              ColorConstant.gray200,
                                          progressColor: ColorConstant.red500,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: getVerticalSize(77),
                                            left: getHorizontalSize(20),
                                            right: getHorizontalSize(20)),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.red500,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            topRight: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            bottomLeft: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            bottomRight: Radius.circular(
                                              getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: getVerticalSize(9),
                                              bottom: getVerticalSize(7)),
                                          child: Text(
                                            "TASK SUMMARY",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                height: .60,
                                                color: ColorConstant.whiteA700),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ],
                  ),
                 /* Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: getVerticalSize(20),
                            bottom: getVerticalSize(8),
                            left: getHorizontalSize(25)),
                        child: Text(
                          "Per Square Feet Rate",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                20,
                              ),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.28,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff2c274c),
                                Color(0xff46426c),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16.0, left: 6.0),
                                      child: LineChartSample1State(
                                          isShowingMainData: isShowingMainData),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),*/
                ])));
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
        lineChartBarData2_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: const Color(0xff4af699),
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: const Color(0xffaa4cfc),
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: const Color(0x00aa4cfc),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: const Color(0xff27b6fc),
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: const Color(0x444af699),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: const Color(0x99aa4cfc),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: const Color(0x33aa4cfc),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: const Color(0x4427b6fc),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
      );
}
