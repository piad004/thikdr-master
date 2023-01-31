import 'package:flutter/material.dart';
import 'package:thikdr/ui/materiallibrary/models/material_library_item_model.dart';
import 'package:thikdr/ui/materiallibrary/receivedmaterial/add_received_material_page.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/math_utils.dart';

// ignore: must_be_immutable
class MateriallistItemWidget extends StatelessWidget {
  MateriallistItemWidget(this.materiallistItemModelObj);

  MaterialLibraryItemModel materiallistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          top: getVerticalSize(
            8.50,
          ),
          bottom: getVerticalSize(
            8.50,
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
                    15.00,
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
                          2.00,
                        ),
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "Steel 8mm",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold122.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: getHorizontalSize(
                          11.00,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            12.00,
                          ),
                          right: getHorizontalSize(
                            12.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          bottom: getVerticalSize(
                            5.00,
                          ),
                        ),
                        decoration:
                            AppDecoration.textstylerobotoromanregular1013,
                        child: Text(
                          "Unit: Numbers",
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular1013.copyWith(
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
              ),
            ),
             Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    12.00,
                  ),
                  right: getHorizontalSize(
                    12.00,
                  ),
                  top: getVerticalSize(
                    12.00,
                  ),
                  bottom: getVerticalSize(
                    12.00,
                  ),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(
                   left: getHorizontalSize(
                     12.00,
                   ),
                   right: getHorizontalSize(
                     12.00,
                   ),
                   top: getVerticalSize(
                     5.00,
                   ),
                   bottom: getVerticalSize(
                     5.00,
                   ),
                 ),
                  decoration: AppDecoration.textstylerobotoromanregular101,
                  child: Text(
                    "Trade: Steel Structure and Metal",
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular101.copyWith(
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

      ),
      );
  }
}
