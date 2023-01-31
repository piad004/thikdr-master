import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../../attendance/addattendance/add_attendance_screen.dart';
import '../models/worker_item_model.dart';

class DiggerItemWidget extends StatelessWidget {
  DiggerItemWidget(this._itemModel);

  WorkerItemModel _itemModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: getHorizontalSize(
            5.00,
          ),
          top: getVerticalSize(
            10,
          ),
          right: getHorizontalSize(
            8.00,
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
                1.00,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child:Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    10.00,
                  ),
                  right: getHorizontalSize(
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
                  "₹ 400",
                  textAlign: TextAlign.right,
                  style: AppStyle.textstylerobotoromanbold166.copyWith(
                      fontSize: getFontSize(
                        16,
                      ),
                      height: 1.20,
                      color: ColorConstant.black900
                  ),
                ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                            5.00,
                          ),
                        ),
                        child:Text(
                          "Digging",
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166.copyWith(
                              fontSize: getFontSize(
                                13,
                              ),
                              height: 1.20,
                              color: ColorConstant.black900
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child:Text(
                          "28th July, Thursday",
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166.copyWith(
                              fontSize: getFontSize(
                                15,
                              ),
                              height: 1.20,
                              color: ColorConstant.black900
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddAttendancePage()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              5.00,
                            ),
                          ),
                          child:Container(
                            height: getVerticalSize(
                              18,
                            ),
                            width: getHorizontalSize(
                              18,
                            ),
                            child: Image.asset(
                              ImageConstant.imgUser1,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              10.00,
                            ),
                            top: getVerticalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              5.00,
                            ),
                          ),
                          child:Text(
                            "1",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanbold166.copyWith(
                                fontSize: getFontSize(
                                  16,
                                ),
                                height: 1.20,
                                color: ColorConstant.red400
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              10.00,
                            ),
                            top: getVerticalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              5.00,
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
                                    5.00,
                                  ),
                                  top: getVerticalSize(
                                    6.00,
                                  ),
                                  bottom: getVerticalSize(
                                    6.00,
                                  ),
                                ),
                                child: Text(
                                  "6 Hours",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular16
                                      .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      height: 1.00,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.red400
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    5.00,
                                  ),
                                  top: getVerticalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    5.00,
                                  ),
                                  bottom: getVerticalSize(
                                    9.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    10,
                                  ),
                                  width: getHorizontalSize(
                                    11,
                                  ),
                                  child: Image.asset(
                                    ImageConstant.imgArrowRightBlack,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              10.00,
                            ),
                            right: getHorizontalSize(
                              10.00,
                            ),
                            top: getVerticalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              5.00,
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
                              color: ColorConstant.bluegray100,
                              width: getHorizontalSize(
                                1.00,
                              ),
                            ),
                          ),
                          child:
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                5.00,
                              ),
                              top: getVerticalSize(
                                10.00,
                              ),
                              right: getHorizontalSize(
                                5.00,
                              ),
                              bottom: getVerticalSize(
                                9.00,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                10,
                              ),
                              width: getHorizontalSize(
                                10,
                              ),
                              child: Image.asset(
                                ImageConstant.imgArrowRightBlack,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),

      ),
    );
  }
}
