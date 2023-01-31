import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_style.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../controller/project_summary_controller.dart';
import '../models/group1036_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Group1036ItemWidget extends StatelessWidget {
  Group1036ItemWidget(this.group1036ItemModelObj);

  Group1036ItemModel group1036ItemModelObj;

  var controller = Get.find<ProjectSummaryController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: getVerticalSize(
          93.00,
        ),
        width: getHorizontalSize(
          180.00,
        ),
        margin: EdgeInsets.only(
          right: getHorizontalSize(
            17.00,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: getVerticalSize(
                  93.00,
                ),
                width: getHorizontalSize(
                  180.00,
                ),
                child: SvgPicture.asset(
                  ImageConstant.imgRectangle58,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    9.00,
                  ),
                  top: getVerticalSize(
                    14.00,
                  ),
                  right: getHorizontalSize(
                    10.00,
                  ),
                  bottom: getVerticalSize(
                    14.00,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "msg_total_material".tr.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanbold123.copyWith(
                        fontSize: getFontSize(
                          12,
                        ),
                        height: 0.67,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          2.00,
                        ),
                        top: getVerticalSize(
                          19.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "lbl_rs_1_94_688".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold164.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 0.50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          2.00,
                        ),
                        top: getVerticalSize(
                          16.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "lbl_add_material".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular111.copyWith(
                          fontSize: getFontSize(
                            11,
                          ),
                          height: 0.73,
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
}
