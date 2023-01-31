import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker/digger_page.dart';
import 'package:thikdr/ui/projectsummary/workertab/staff/payment/payment_page.dart';

import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../models/staff_item_model.dart';

// ignore: must_be_immutable
class StaffItemWidget extends StatelessWidget {
  StaffItemWidget(this._itemModel);

  StaffItemModel _itemModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(
          top: getVerticalSize(
            8.00,
          ),
          right: getVerticalSize(
            5.00,
          ),
          bottom: getVerticalSize(
            8.00,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  10.00,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        10.00,
                      ),
                      top: getVerticalSize(
                        5.00,
                      ),
                      bottom: getVerticalSize(
                        20.00,
                      ),
                    ),
                    child: Image.asset(
                      ImageConstant.imgUser,
                      height: getVerticalSize(
                        40.00,
                      ),
                      width: getHorizontalSize(
                        40.00,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        10.00,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: getVerticalSize(
                            18.00,
                          ),
                          /* width: getHorizontalSize(
                            168.00,
                          ),*/
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              6,
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
                            "Staff name",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular103
                                .copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              fontWeight: FontWeight.w800,
                              height: 1.20,
                            ),
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            18.00,
                          ),
                          /* width: getHorizontalSize(
                            168.00,
                          ),*/
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              10.00,
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
                            "ID789876679876",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular103
                                .copyWith(
                              fontSize: getFontSize(
                                12,
                              ),
                              height: 1.20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  15.00,
                ),
                bottom: getVerticalSize(
                  5.00,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: getVerticalSize(
                        5.00,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        4.00,
                      ),
                      bottom: getVerticalSize(
                        4.00,
                      ),
                      left: getHorizontalSize(
                        8.00,
                      ),
                      right: getHorizontalSize(
                        8.00,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.orangeA100,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          20.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "IN 400",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanregular103.copyWith(
                        fontSize: getFontSize(
                          13,
                        ),
                        height: 1.20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: getVerticalSize(
                        5.00,
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
                      "Settled",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanregular103.copyWith(
                        fontSize: getFontSize(
                          13,
                        ),
                        fontWeight: FontWeight.bold,
                        height: 1.20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  5.00,
                ),
                right: getHorizontalSize(
                  5.00,
                ),
              ),
              child: InkWell(
                // onTap: ()
                // {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => WorkerNamePage()));/*
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => DiggerPage()));*/
                // },
                child: Container(
                  height: getVerticalSize(
                    26.53,
                  ),
                  width: getHorizontalSize(
                    8.97,
                  ),
                  child: SvgPicture.asset(
                    ImageConstant.imgDot,
                    fit: BoxFit.fill,
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
