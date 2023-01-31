import 'package:thikdr/ui/projectsummary/job/models/Job_item_model.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JobItemWidget extends StatelessWidget {
  JobItemWidget(this.paymentItemModelObj);

  JobItemModel paymentItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child:
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  5.00,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  right: getHorizontalSize(
                    8.00,
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20.00,
                    ),
                  ),
                ),
                child: Text(
                  "7th Jun",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular136
                      .copyWith(
                    fontSize: getFontSize(
                      13,
                    ),
                    color: ColorConstant.black900,
                    height: 0.62,
                  ),
                ),
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

                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    8.00,
                  ),
                  right: getHorizontalSize(
                    8.00,
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20.00,
                    ),
                  ),
                ),
                child: Text(
                  "Sample Task",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular136
                      .copyWith(
                    fontSize: getFontSize(
                      13,
                    ),
                    color: ColorConstant.black900,
                    height: 0.62,
                  ),
                ),
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

                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    8.00,
                  ),
                  right: getHorizontalSize(
                    8.00,
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20.00,
                    ),
                  ),
                ),
                child: Text(
                  "30th July",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular136
                      .copyWith(
                    fontSize: getFontSize(
                      13,
                    ),
                    color: ColorConstant.black900,
                    height: 0.62,
                  ),
                ),
              ),
            ),
            Padding(
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
                bottom: getVerticalSize(
                  5.00,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    8.00,
                  ),
                  right: getHorizontalSize(
                    8.00,
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20.00,
                    ),
                  ),
                ),
                child: Text(
                  "90%",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular136.copyWith(
                    fontSize: getFontSize(
                      13,
                    ),
                    color: ColorConstant.black900,
                    height: 0.62,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
