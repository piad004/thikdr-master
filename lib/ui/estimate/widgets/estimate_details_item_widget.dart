import 'package:get/get.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/math_utils.dart';
import '../models/estimate_details_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EstimateDetailsItemWidget extends StatelessWidget {
  EstimateDetailsItemWidget(this.estimateDetailsItemModelObj);

  EstimateDetailsItemModel estimateDetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return
      Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: getVerticalSize(
            1.00,
          ),
          width: getHorizontalSize(
            377.00,
          ),
          margin: EdgeInsets.only(
            right: getHorizontalSize(
              2.00,
            ),
          ),
          decoration: BoxDecoration(
            color: ColorConstant.gray301,
          ),
        ),

        Container(
          margin: EdgeInsets.only(
            left: getHorizontalSize(
              1.00,
            ),
          ),
          decoration: BoxDecoration(
            color: ColorConstant.gray50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
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
                child: Text(
                  "Advance : Rs 0.00",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular1014.copyWith(
                    fontSize: getFontSize(
                      14,
                    ),
                    height: 1.00,
                  ),
                ),
              ),
              Padding(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
