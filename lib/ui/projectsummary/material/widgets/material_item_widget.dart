import 'package:thikdr/ui/projectsummary/job/models/job_item_model.dart';
import 'package:thikdr/ui/projectsummary/material/models/material_item_model.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MaterialItemWidget extends StatelessWidget {
  MaterialItemWidget(this._materialItemModel);

  MaterialItemModel _materialItemModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(
          left: getHorizontalSize(
            0.00,
          ),
          top: getVerticalSize(
            10,
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                        10.00,
                      ),
                    ),
                    child:Text(
                      "M-sand",
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanbold166.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                          color: ColorConstant.black900
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: getHorizontalSize(10),bottom: getVerticalSize(8)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(3),top: getVerticalSize(3)),
                      decoration: BoxDecoration(
                        color: ColorConstant.red100,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Civil",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular102.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                        10.00,
                      ),
                    ),
                    child:Text(
                      "150",
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanbold166.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                          color: ColorConstant.deepPurpleA700
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: getHorizontalSize(10),bottom: getVerticalSize(8)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(3),top: getVerticalSize(3)),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepPurple100,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "cft",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular102.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                          color: ColorConstant.deepPurpleA700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                        10.00,
                      ),
                    ),
                    child:Text(
                      "150",
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanbold166.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                          color: ColorConstant.green900
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: getHorizontalSize(10),bottom: getVerticalSize(8)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(3),top: getVerticalSize(3)),
                      decoration: BoxDecoration(
                        color: ColorConstant.green50,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "cft",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular102.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1.20,
                          color: ColorConstant.green900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Image.asset(
                  ImageConstant.imgArrowRightBlack,
                  height: getVerticalSize(
                    20.00,
                  ),
                  width: getHorizontalSize(
                    20.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),

            ]),

      ),
    );
  }
}
