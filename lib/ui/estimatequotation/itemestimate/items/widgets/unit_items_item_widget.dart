import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../models/unit_items_model.dart';

// ignore: must_be_immutable
class UnitItemsItemWidget extends StatelessWidget {
  UnitItemsItemWidget(this.unitItemsItemModelObj);

  UnitItemsModel unitItemsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          top: getVerticalSize(
            5,
          ),
          bottom: getVerticalSize(
            5,
          ),
          right: getHorizontalSize(
            5,
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
                2,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    11.00,
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
                          12.00,
                        ),
                        top: getVerticalSize(
                          6.00,
                        ),
                        bottom: getVerticalSize(
                          6.00,
                        ),
                      ),
                      child: Text(
                        "Bags",
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
                          10.00,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                        child: SvgPicture.asset(
                          ImageConstant.imgEditicon,
                          fit: BoxFit.fill,
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
                    12.00,
                  ),
                  top: getVerticalSize(
                    5.00,
                  ),
                  right: getHorizontalSize(
                    12.00,
                  ),
                  bottom: getVerticalSize(
                    10.00,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    20.00,
                  ),
                  width: getHorizontalSize(
                    43.00,
                  ),
                  decoration: AppDecoration.textstylerobotoromanregular101,
                  child: Text(
                    "Bag",
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular101.copyWith(
                      fontSize: getFontSize(
                        10,
                      ),
                      height: 1.20,
                    ),
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
