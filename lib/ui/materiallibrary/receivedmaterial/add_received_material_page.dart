import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class AddReceivedMaterialPage extends StatefulWidget {
  @override
  State<AddReceivedMaterialPage> createState() => _AddReceivedMaterialState();
}

class _AddReceivedMaterialState extends State<AddReceivedMaterialPage>
    with TickerProviderStateMixin {
  TextEditingController partynameController = TextEditingController();
  TextEditingController notesBillNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
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
                "Received".toUpperCase(),
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
            bottomNavigationBar:
            Padding(
              padding: EdgeInsets.only(
                bottom: getVerticalSize(
                  5.00,
                ),
                left: getHorizontalSize(
                  5.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          10.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "Attach Bill",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle
                            .textstylerobotoromanregular137
                            .copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          30.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                10.00,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      10.00,
                                    ),
                                    right: getHorizontalSize(
                                      10.00,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      26.00,
                                    ),
                                    width: getHorizontalSize(
                                      30.00,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgCameraRed,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        7.00,
                                      ),
                                    ),
                                    child: Text(
                                      "CAMERA",
                                      overflow:
                                      TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanbold133
                                          .copyWith(
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              45.00,
                            ),
                            width: getHorizontalSize(
                              1.50,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                21.00,
                              ),
                              bottom: getVerticalSize(
                                3.00,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.red900,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                19.50,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        10.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getSize(
                                        30.00,
                                      ),
                                      width: getSize(
                                        30.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant
                                            .imgGalleryRed,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        3.00,
                                      ),
                                    ),
                                    child: Text(
                                      "GALLERY",
                                      overflow:
                                      TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanbold133
                                          .copyWith(
                                        fontSize: getFontSize(
                                          13,
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
                              left: getHorizontalSize(
                                45.00,
                              ),
                              top: getVerticalSize(
                                1.00,
                              ),
                              bottom: getVerticalSize(
                                2.00,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                45.00,
                              ),
                              width: getHorizontalSize(
                                174.00,
                              ),
                              decoration: AppDecoration
                                  .textstylerobotoromanbold13,
                              child: Text(
                                "Save",
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanbold13
                                    .copyWith(
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
                  ),
                ],
              ),
            ),
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          38.00,
                        ),
                        bottom: getVerticalSize(
                          18.00,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
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
                                  right: getHorizontalSize(
                                    1.00,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConstant.black90040,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            19.00,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  14.00,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    25.00,
                                                  ),
                                                ),
                                                border: Border.all(
                                                  color: ColorConstant.bluegray100,
                                                  width: getHorizontalSize(
                                                    1.00,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        16.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        15.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        15.00,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Material",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstylerobotoromanregular16
                                                          .copyWith(
                                                        fontSize: getFontSize(
                                                          16,
                                                        ),
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        55,
                                                      ),
                                                      top: getVerticalSize(
                                                        14.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        17.49,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        13.53,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      height: getVerticalSize(
                                                        8.47,
                                                      ),
                                                      width: getHorizontalSize(
                                                        15.87,
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
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  1.00,
                                                ),
                                                right: getHorizontalSize(
                                                  14.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  3.00,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    25.00,
                                                  ),
                                                ),
                                                border: Border.all(
                                                  color: ColorConstant.bluegray100,
                                                  width: getHorizontalSize(
                                                    1.00,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        6.00,
                                                      ),
                                                     right: getHorizontalSize(
                                                        10.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        4.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        4.00,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      height: getSize(
                                                        28.00,
                                                      ),
                                                      width: getSize(
                                                        28.00,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        ImageConstant.imgCalendar,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        8,
                                                      ),
                                                      top: getVerticalSize(
                                                        15.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        15.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        15.00,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "13.07.2022",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstylerobotoromanregular16
                                                          .copyWith(
                                                        fontSize: getFontSize(
                                                          16,
                                                        ),
                                                        height: 1.00,
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          14.00,
                                        ),
                                        top: getVerticalSize(
                                          15.00,
                                        ),
                                        right: getHorizontalSize(
                                          14.00,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          46.00,
                                        ),
                                        width: getHorizontalSize(
                                          MediaQuery.of(context).size.width,
                                        ),
                                        child: TextFormField(
                                          controller:
                                          partynameController,
                                          decoration: InputDecoration(
                                            hintText: "Party name",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: getFontSize(
                                                16.0,
                                              ),
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color: ColorConstant.bluegray100,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color: ColorConstant.bluegray100,
                                                width: 1,
                                              ),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  7.00,
                                                ),
                                                right: getHorizontalSize(
                                                  10.00,
                                                ),
                                              ),
                                              child: Container(
                                                height: getSize(
                                                  28.00,
                                                ),
                                                width: getSize(
                                                  28.00,
                                                ),
                                                child: SvgPicture.asset(
                                                  ImageConstant.imgUser1,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            prefixIconConstraints: BoxConstraints(
                                              minWidth: getSize(
                                                28.00,
                                              ),
                                              minHeight: getSize(
                                                28.00,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: ColorConstant.whiteA700,
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                15.00,
                                              ),
                                              bottom: getVerticalSize(
                                                15.00,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.gray500,
                                            fontSize: getFontSize(
                                              16.0,
                                            ),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            15.00,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: getHorizontalSize(
                                                (size.width/2.6),
                                              ),
                                              margin: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  14.00,
                                                ),
                                              ),
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  16.00,
                                                ),
                                                top: getVerticalSize(
                                                  15.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  15.00,
                                                ),
                                              ),
                                              decoration: AppDecoration
                                                  .textstylerobotoromanregular166,
                                              child: Text(
                                                "Quantity",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular166
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  8.00,
                                                ),
                                                top: getVerticalSize(
                                                  12.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  12.00,
                                                ),
                                              ),
                                              child: Container(
                                                height: getSize(
                                                  17.00,
                                                ),
                                                width: getSize(
                                                  17.00,
                                                ),
                                                child: SvgPicture.asset(
                                                  ImageConstant.imgClose,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: getHorizontalSize(
                                                  (size.width/2.6),
                                              ),
                                              margin: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  8.00,
                                                ),
                                              ),
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  12.00,
                                                ),
                                                top: getVerticalSize(
                                                  15.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  15.00,
                                                ),
                                              ),
                                              decoration: AppDecoration
                                                  .textstylerobotoromanregular166,
                                              child: Text(
                                                "Unit Rate",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular166
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            15.00,
                                          ),
                                          top: getVerticalSize(
                                            30.00,
                                          ),
                                          right: getHorizontalSize(
                                            14.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Total amount",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular137
                                              .copyWith(
                                            fontSize: getFontSize(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          14.00,
                                        ),
                                        top: getVerticalSize(
                                          28.00,
                                        ),
                                        right: getHorizontalSize(
                                          14.00,
                                        ),
                                        bottom: getVerticalSize(
                                          19.00,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          46.00,
                                        ),
                                        width: getHorizontalSize(
                                          size.width,
                                        ),
                                        child: TextFormField(
                                          controller:
                                          notesBillNoController,
                                          decoration: InputDecoration(
                                            hintText: "Notes (Bill No, Vehicle No...)",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: getFontSize(
                                                16.0,
                                              ),
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color: ColorConstant.bluegray100,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color: ColorConstant.bluegray100,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: ColorConstant.whiteA700,
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                16.00,
                                              ),
                                              top: getVerticalSize(
                                                15.00,
                                              ),
                                              bottom: getVerticalSize(
                                                15.00,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.gray500,
                                            fontSize: getFontSize(
                                              16.0,
                                            ),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
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
                    ),
                  ),
                ],
              ),
            ),
        )
    );
  }
}
