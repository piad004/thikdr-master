import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';

class EstimateItemWidget extends StatefulWidget {
  final Function(int) onTileSelected;
  int index;
  EstimateItemWidget(this.index, this.onTileSelected);

  @override
  State<EstimateItemWidget> createState() => _EstimateItemWidgetState();
}

class _EstimateItemWidgetState extends State<EstimateItemWidget> {
  String? theTeam = null;
  final items = [
    'Confirm',
    'Cancel',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 5),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 45,
                  width: WidgetsBinding.instance.window.physicalSize.width,
                  margin: EdgeInsets.only(
                    left: 2,
                    right: 1,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      /*Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            ImageConstant.imgBaseBg,
                            height: 45,
                            width:
                            WidgetsBinding.instance.window
                                .physicalSize.width,
                            fit: BoxFit.fill,
                          ),
                        ),*/
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                            top: 10,
                            right: 5,
                            bottom: 9,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 7,
                                  bottom: 7,
                                ),
                                child: Text(
                                  "Ram Krisno (Sawrup,)",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textstylerobotoromanregular129
                                      .copyWith(
                                          fontSize: 14,
                                          height: 0.75,
                                          color: ColorConstant.black900),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    40,
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.gray300,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        child: SvgPicture.asset(
                                          ImageConstant.imgCalendar,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    /* Padding(
                                        padding: EdgeInsets.only(
                                          left:10,
                                          top: 6,
                                          bottom: 5,
                                        ),
                                        child: Container(
                                          height: 12,
                                          width: 12,
                                          child: SvgPicture.asset(
                                            ImageConstant
                                                .imgCalenderWhite,
                                            fit: BoxFit.fill,
                                            color: ColorConstant.gray300
                                          ),
                                        ),
                                      ),*/
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3,
                                        top: 8,
                                        right: 16,
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        "09/04/2022",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: AppStyle
                                            .textstylerobotoromanregular10
                                            .copyWith(
                                                fontSize: 14,
                                                height: 0.90,
                                                color: ColorConstant.black900),
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
              Padding(
                padding: EdgeInsets.only(
                  top: 1,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 2,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Ref No : 1",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular1014
                                  .copyWith(
                                fontSize: 12,
                                height: 1.00,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Status : ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1014
                                      .copyWith(
                                    fontSize: 12,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 5),
                                /* height: getVerticalSize(
                                        22.00,
                                      ),*/
                                decoration: AppDecoration
                                    .textstylerobotoromanregular1013,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 4, bottom: 4),
                                  child: Text(
                                    "Open Estimate",
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstylerobotoromanregular1013
                                        .copyWith(
                                      fontSize: 12,
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ),
                              /*  Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.only(
                                          top: 5,
                                          right: 10,
                                          left: 10,
                                          bottom: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                           10,
                                          ),
                                          border: Border.all(
                                            color:ColorConstant
                                                .yellow500
                                          ),
                                        ),
                                      child: Text(
                                        "Open Estimate",
                                        overflow:
                                        TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanregular1014
                                            .copyWith(
                                            fontSize:
                                            12,
                                            height: 1.00,
                                            color: ColorConstant
                                                .yellow500),
                                      ),
                                    ),*/
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /* Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              right: 2,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray301,
                            ),
                          ),*/
                        Container(
                          margin: EdgeInsets.only(
                            left: 1,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Total : Rs 762.50",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1014
                                      .copyWith(
                                    fontSize: 12,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Expired Date : 09/04/2022",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1014
                                      .copyWith(
                                    fontSize: 12,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*  Padding(
                        padding: EdgeInsets.only(
                          left:1,
                        ),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: estimateDetailsModelObj
                              .value.estimateDetailsItemList.length,
                          itemBuilder: (context, index) {
                            EstimateDetailsItemModel model =
                            estimateDetailsModelObj.value
                                .estimateDetailsItemList[index];
                            return EstimateDetailsItemWidget(
                              model,
                            );
                          },
                        ),
                      ),*/
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /* Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              right: 2,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray301,
                            ),
                          ),*/
                        Container(
                          margin: EdgeInsets.only(
                            left: 1,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 10,
                                  bottom: 10,
                                ),
                                // child: Text(
                                //   "Balance : Rs 762.50",
                                //   overflow: TextOverflow.ellipsis,
                                //   textAlign: TextAlign.left,
                                //   style: AppStyle
                                //       .textstylerobotoromanregular1014
                                //       .copyWith(
                                //     fontSize: 12,
                                //     height: 1.00,
                                //   ),
                                // ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     left: 12,
                              //     top: 10,
                              //     bottom: 10,
                              //     right: 5,
                              //   ),
                              //   child: Text(
                              //     "Due Date : 09/04/2022",
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.left,
                              //     style: AppStyle
                              //         .textstylerobotoromanregular1014
                              //         .copyWith(
                              //       fontSize: 12,
                              //       height: 1.00,
                              //     ),
                              //   ),
                              // ),

/*Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    73.00,
                                  ),
                                  bottom: getVerticalSize(
                                    10.00,
                                  ),
                                ),
                                child: Text(
                                  "Ref No : 1",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular1014.copyWith(
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    height: 1.00,
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          right: 2,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.gray301,
                        ),
                      ),*/
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        left: 5,
                        top: 9,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray302,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              _makePhoneCall("");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                ImageConstant.imgEdit1,
                                fit: BoxFit.fill,
                              ),
                            ),
                            /* Container(
                                margin: EdgeInsets.only(
                                  left:10,
                                  right: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.red200,
                                    width:1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                      10
                                      ),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset(
                                          ImageConstant.imgEdit1,
                                          fit: BoxFit.fill, color: ColorConstant.red200,
                                        ),
                                      ),
                                    ),
                                    */ /*Padding(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        top: 5,
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        "Call",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotoromanregular1018
                                            .copyWith(
                                          fontSize:12,
                                          height: 1.70,
                                        ),
                                      ),
                                    ),*/ /*
                                  ],
                                ),
                              ),*/
                          ),
                          InkWell(
                            onTap: () {
                              _makePhoneCall("");
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                ImageConstant.imgShare1,
                                fit: BoxFit.fill,
                              ),
                            ),
                            /*  Container(
                                margin: EdgeInsets.only(
                                  left:10,
                                  right: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.red200,
                                    width:1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                       10
                                      ),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        child: Image.asset(
                                          ImageConstant.imgShare1,
                                          fit: BoxFit.fill, color: ColorConstant.red200,
                                        ),
                                      ),
                                    ),
                                   */ /* Padding(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        top: 5,
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        "Call",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotoromanregular1018
                                            .copyWith(
                                          fontSize:12,
                                          height: 1.70,
                                        ),
                                      ),
                                    ),*/ /*
                                  ],
                                ),
                              ),*/
                          ),
                          InkWell(
                            //+919007091555
                            onTap: () => {_whatsapp(context, '')},
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  4,
                                ),
                                border: Border.all(
                                  color: ColorConstant.green500,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /* Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top:5,
                                        bottom: 5,
                                      ),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        child: SvgPicture.asset(
                                          ImageConstant.imgWhatsAppGreen,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),*/
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      top: 2,
                                      right: 10,
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      "View",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular1019
                                          .copyWith(
                                        fontSize: 12,
                                        height: 1.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            // onTap: () => {
                            //   widget.onTileSelected(widget.index),
                            // },
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border: Border.all(
                                  color: ColorConstant.yellow500,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: Container(
                                      height: 17,
                                      width: 85,
                                      child: DropdownButton(
                                        value: theTeam,
                                        items: items
                                            .map((String val) =>
                                                DropdownMenuItem<String>(
                                                  value: val,
                                                  child: Text(val,style: TextStyle(fontSize: 15),),
                                                ))
                                            .toList(),
                                        hint: Text('Status',style: TextStyle(fontSize: 13),),
                                        onChanged: (String? value) {
                                          setState(() {
                                            theTeam = value!;
                                          });
                                        },
                                        underline: Text(''),
                                        isExpanded: true,
                                      ),
                                    ),
                                  )
                                  /* Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      child: Container(
                                        height: 7,
                                        width: 7,
                                        child: SvgPicture.asset(
                                          ImageConstant.imgArrowDown,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),*/
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* Padding(
                        padding: EdgeInsets.only(
                          top:10,
                          bottom:5,
                          left: 5,
                          right: 5
                        ),
                        child:
                        InkWell(
                          onTap: ()=>{
                            onTileSelected(index),
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width:
                            MediaQuery.of(context).size.width,
                            decoration: AppDecoration
                                .textstylerobotoromanbold13,
                            child: Text(
                              //"Convert To Sale",
                              "Convert To Invoice",
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .textstylerobotoromanbold13
                                  .copyWith(
                                fontSize:12,
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
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }

  Future<void> _whatsapp(BuildContext context, String contact) async {
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('WhatsApp is not installed.'),
      ));
    }
  }
}

// Container(
// margin: EdgeInsets.only(
// left: 1,
// ),
// decoration: BoxDecoration(
// color: ColorConstant.whiteA700,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisSize: MainAxisSize.max,
// children: [
// Padding(
// padding: EdgeInsets.only(
// left: 12,
// top: 10,
// bottom: 10,
// ),
// child: Text(
// "Total : Rs 762.50",
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: AppStyle
//     .textstylerobotoromanregular1014
//     .copyWith(
// fontSize: 12,
// height: 1.00,
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 10,
// right:10,
// bottom: 10,
// ),
// child: Text(
// "Advance : Rs 0.00",
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: AppStyle.textstylerobotoromanregular1014.copyWith(
// fontSize: 12,
// height: 1.00,
// ),
// ),
// ),
// ],
// ),
// ),

// Container(
// margin: EdgeInsets.only(
// left: 1,
// ),
// decoration: BoxDecoration(
// color: ColorConstant.whiteA700,
// ),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// mainAxisSize: MainAxisSize.max,
// children: [
// Padding(
// padding: EdgeInsets.only(
// left: 12,
// right: 12,
// top: 10,
// bottom: 10,
// ),
// child: Text(
// "Balance : Rs 762.50",
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: AppStyle
//     .textstylerobotoromanregular1014
//     .copyWith(
// fontSize: 12,
// height: 1.00,
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// left: 12,
// top: 10,
// bottom: 10,
// right: 5,
// ),
// child: Text(
// "Due Date : 09/04/2022",
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: AppStyle
//     .textstylerobotoromanregular1014
//     .copyWith(
// fontSize: 12,
// height: 1.00,
// ),
// ),
// ),
//
// /*Padding(
//                                 padding: EdgeInsets.only(
//                                   top: getVerticalSize(
//                                     10.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     73.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     10.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "Ref No : 1",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.textstylerobotoromanregular1014.copyWith(
//                                     fontSize: getFontSize(
//                                       14,
//                                     ),
//                                     height: 1.00,
//                                   ),
//                                 ),
//                               ),*/
// ],
// ),
// ),
