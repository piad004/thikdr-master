import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../theme/app_decoration.dart';
import '../../../../../../theme/app_style.dart';
import '../../../../../../utils/color_constant.dart';
import '../../../../../../utils/image_constant.dart';
import '../../../../../../utils/math_utils.dart';
import '../models/add_product_item_model.dart';

// ignore: must_be_immutable
class AddProductItemWidget extends StatelessWidget {
  AddProductItemWidget(this.addProductItemModelObj);

  AddProductItemModel addProductItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getVerticalSize(
          7.50,
        ),
        bottom: getVerticalSize(
          7.50,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: getHorizontalSize(MediaQuery.of(context).size.width / 2),
            padding: EdgeInsets.only(
              left: getHorizontalSize(
                16.00,
              ),
              top: getVerticalSize(
                10.00,
              ),
              bottom: getVerticalSize(
                10.00,
              ),
            ),
            decoration: AppDecoration.textstylerobotoromanregular1410,
            child: Text(
              "Sale Price",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.textstylerobotoromanregular1410.copyWith(
                fontSize: getFontSize(
                  14,
                ),
                height: 1.14,
              ),
            ),
          ),
          Container(

            width: getHorizontalSize((MediaQuery.of(context).size.width / 2)-20),
            margin: EdgeInsets.only(
              left: getHorizontalSize(
                10.00,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      10.00,
                    ),
                    bottom: getVerticalSize(
                      10.00,
                    ),
                  ),
                  child: Text(
                    "Tax Excluded",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular1411.copyWith(
                      fontSize: getFontSize(
                        14,
                      ),
                      height: 1.14,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      14.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                    bottom: getVerticalSize(
                      13.00,
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
        ],
      ),
    );
  }
}
