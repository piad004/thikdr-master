import '../../../../../../theme/app_decoration.dart';
import '../../../../../../theme/app_style.dart';
import '../../../../../../utils/color_constant.dart';
import '../../../../../../utils/image_constant.dart';
import '../../../../../../utils/math_utils.dart';
import '../models/add_attendance_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AddAttendanceItemWidget extends StatelessWidget {
  AddAttendanceItemWidget(this.addAttendanceItemModelObj);

  AddAttendanceItemModel addAttendanceItemModelObj;


  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: getVerticalSize(
        58.00,
      ),
      width: getHorizontalSize(
        379.00,
      ),*/
      margin: EdgeInsets.only(
        top: getVerticalSize(
          9.50,
        ),
        bottom: getVerticalSize(
          9.50,
        ),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                right: getHorizontalSize(
                  1.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
                border: Border.all(
                  color: ColorConstant.gray303,
                  width: getHorizontalSize(
                    1.00,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: getVerticalSize(
                      58.00,
                    ),
                    width: getHorizontalSize(
                      77.00,
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.imgAdd,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        68.00,
                      ),
                      top: getVerticalSize(
                        13.00,
                      ),
                      right: getHorizontalSize(
                        22.00,
                      ),
                      bottom: getVerticalSize(
                        7.00,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.center,
                            height: getVerticalSize(
                              20.00,
                            ),
                            width: getHorizontalSize(
                              111.00,
                            ),
                            decoration:
                                AppDecoration.textstylerobotoromanregular125,
                            child: Text(
                              "No. of Worker",
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular125
                                  .copyWith(
                                fontSize: getFontSize(
                                  14,
                                ),
                                height: 1.00,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              52.00,
                            ),
                            top: getVerticalSize(
                              6.00,
                            ),
                            right: getHorizontalSize(
                              52.00,
                            ),
                          ),
                          child: Text(
                            "2",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular126
                                .copyWith(
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
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  10.00,
                ),
              ),
              child: Container(
                height: getVerticalSize(
                  58.00,
                ),
                width: getHorizontalSize(
                  77.00,
                ),
                child: SvgPicture.asset(
                  ImageConstant.imgMinus,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
