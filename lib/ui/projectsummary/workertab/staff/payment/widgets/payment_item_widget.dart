import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../theme/app_decoration.dart';
import '../../../../../../theme/app_style.dart';
import '../../../../../../utils/color_constant.dart';
import '../../../../../../utils/image_constant.dart';
import '../../../../../../utils/math_utils.dart';

class PaymentItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          top: getVerticalSize(
            8.00,
          ),
          bottom: getVerticalSize(
            8.00,
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
                6,
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
                    17.00,
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
                          5.00,
                        ),
                        bottom: getVerticalSize(
                          4.00,
                        ),
                      ),
                      child: Text(
                        "Digging",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold122.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 0.67,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: getHorizontalSize(
                          16.00,
                        ),
                      ),
                      child: Text(
                        "lbl_rs_400".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold121.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.42,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  12.00,
                ),
                top: getVerticalSize(
                  11.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
                bottom: getVerticalSize(
                  14.00,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      20.00,
                    ),
                    width: getHorizontalSize(
                      90.00,
                    ),
                    decoration: AppDecoration.textstylerobotoromanregular101,
                    child: Text(
                      "lbl_14_feb_mon".tr,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanregular101.copyWith(
                        fontSize: getFontSize(
                          10,
                        ),
                        height: 1.20,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.lightBlue50,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              45.00,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: getVerticalSize(
                                20.00,
                              ),
                              width: getHorizontalSize(
                                26.00,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.lightBlue100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    getHorizontalSize(
                                      45.00,
                                    ),
                                  ),
                                  topRight: Radius.circular(
                                    getHorizontalSize(
                                      0.00,
                                    ),
                                  ),
                                  bottomLeft: Radius.circular(
                                    getHorizontalSize(
                                      45.00,
                                    ),
                                  ),
                                  bottomRight: Radius.circular(
                                    getHorizontalSize(
                                      0.00,
                                    ),
                                  ),
                                ),
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                color: ColorConstant.lightBlue100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      getHorizontalSize(
                                        45.00,
                                      ),
                                    ),
                                    topRight: Radius.circular(
                                      getHorizontalSize(
                                        0.00,
                                      ),
                                    ),
                                    bottomLeft: Radius.circular(
                                      getHorizontalSize(
                                        45.00,
                                      ),
                                    ),
                                    bottomRight: Radius.circular(
                                      getHorizontalSize(
                                        0.00,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            10.00,
                                          ),
                                          top: getVerticalSize(
                                            5.00,
                                          ),
                                          right: getHorizontalSize(
                                            6.00,
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
                                            12.00,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgVector52,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  11.00,
                                ),
                                top: getVerticalSize(
                                  4.00,
                                ),
                                right: getHorizontalSize(
                                  12.00,
                                ),
                                bottom: getVerticalSize(
                                  4.00,
                                ),
                              ),
                              child: Text(
                                "lbl_3".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular127
                                    .copyWith(
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            11.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              45.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.gray301,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  7.00,
                                ),
                                top: getVerticalSize(
                                  4.00,
                                ),
                                bottom: getVerticalSize(
                                  4.00,
                                ),
                              ),
                              child: Text(
                                "lbl_8_hours".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular126
                                    .copyWith(
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  height: 1.00,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  12.30,
                                ),
                                top: getVerticalSize(
                                  7.73,
                                ),
                                right: getHorizontalSize(
                                  10.65,
                                ),
                                bottom: getVerticalSize(
                                  7.00,
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
                                  ImageConstant.imgVector53,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            6.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              45.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.gray301,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: ColorConstant.gray301,
                              width: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                45.00,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      2.00,
                                    ),
                                    top: getVerticalSize(
                                      5.00,
                                    ),
                                    right: getHorizontalSize(
                                      10.00,
                                    ),
                                    bottom: getVerticalSize(
                                      5.00,
                                    ),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.imgEdit,
                                    height: getVerticalSize(
                                      10.00,
                                    ),
                                    width: getHorizontalSize(
                                      15.00,
                                    ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}