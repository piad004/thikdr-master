import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../controller/project_summary_controller.dart';
import '../models/group1054_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Group1054ItemWidget extends StatelessWidget {
  Group1054ItemWidget(this.group1054ItemModelObj);

  Group1054ItemModel group1054ItemModelObj;

  var controller = Get.find<ProjectSummaryController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(
            right: getHorizontalSize(
              20.26,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getHorizontalSize(
                10.00,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment(
                1,
                0.019,
              ),
              end: Alignment(
                0.031,
                1,
              ),
              colors: [
                ColorConstant.lightBlue51,
                ColorConstant.whiteA700,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    32.00,
                  ),
                  top: getVerticalSize(
                    51.00,
                  ),
                  right: getHorizontalSize(
                    32.00,
                  ),
                ),
                child: Image.asset(
                  ImageConstant.img26832741,
                  height: getSize(
                    30.00,
                  ),
                  width: getSize(
                    30.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    32.00,
                  ),
                  top: getVerticalSize(
                    9.00,
                  ),
                  right: getHorizontalSize(
                    32.00,
                  ),
                ),
                child: Text(
                  "lbl_80".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanbold14.copyWith(
                    fontSize: getFontSize(
                      14,
                    ),
                    height: 0.57,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    32.00,
                  ),
                  top: getVerticalSize(
                    6.00,
                  ),
                  right: getHorizontalSize(
                    32.00,
                  ),
                  bottom: getVerticalSize(
                    23.00,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    13.00,
                  ),
                  width: getHorizontalSize(
                    46.00,
                  ),
                  decoration: AppDecoration.textstylerobotoromanregular86,
                  child: Text(
                    "lbl_project".tr,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular86.copyWith(
                      fontSize: getFontSize(
                        8,
                      ),
                      height: 1.00,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
