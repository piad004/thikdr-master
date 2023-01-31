import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/workertab/staff/widgets/staff_item_widget.dart';
import 'package:thikdr/utils/color_constant.dart';

import '../../../../theme/app_style.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'models/staff_item_model.dart';

class StaffPage extends StatefulWidget {
  @override
  State<StaffPage> createState() => _StaffState();
}

class _StaffState extends State<StaffPage> with TickerProviderStateMixin{
  TextEditingController searchbynameController = TextEditingController();

  List<StaffItemModel> _list =[
    StaffItemModel(""),
    StaffItemModel(""),
    StaffItemModel(""),
    StaffItemModel(""),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: getHorizontalSize(
            1.00,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(
                44.00,
              ),
              child: TextFormField(
                controller: searchbynameController,
                decoration: InputDecoration(
                  hintText: "Search Staff...",
                  hintStyle: AppStyle.textstylerobotoromanregular147.copyWith(
                    fontSize: getFontSize(
                      16.0,
                    ),
                    color: ColorConstant.gray700,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        45.00,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: ColorConstant.gray301,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        45.00,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: ColorConstant.gray301,
                      width: 1,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        10.00,
                      ),
                      right: getHorizontalSize(
                        10.00,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        22.00,
                      ),
                      width: getSize(
                        22.00,
                      ),
                      child: SvgPicture.asset(
                        ImageConstant.imgSearch,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: getSize(
                      16.00,
                    ),
                    minHeight: getSize(
                      46.00,
                    ),
                  ),
                  filled: true,
                  fillColor: ColorConstant.whiteA700,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
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
                ),
                style: TextStyle(
                  color: ColorConstant.gray700,
                  fontSize: getFontSize(
                    14.0,
                  ),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: getVerticalSize(
                  15.00,
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
                "Admin(Full access)",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle
                    .textstylerobotoromanregular103
                    .copyWith(
                  fontSize: getFontSize(
                    14,
                  ),
                  fontWeight: FontWeight.bold,
                  height: 1.20,
                ),
              ),
            ),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          margin: EdgeInsets.only(
            top: getVerticalSize(
              8.00,
            ), right: getVerticalSize(
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
                              "Super Admin Name",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .textstylerobotoromanregular103
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
                              "ADM007",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .textstylerobotoromanregular103
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
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          4.00,
                        ), bottom: getVerticalSize(
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
                        color: ColorConstant.lightBlue100,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Super Admin",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle
                            .textstylerobotoromanregular103
                            .copyWith(
                          fontSize: getFontSize(
                            13,
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
      ),
            Container(
              margin: EdgeInsets.only(
                top: getVerticalSize(
                  15.00,
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
                "Staff(Can only view his own attendance)",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle
                    .textstylerobotoromanregular103
                    .copyWith(
                  fontSize: getFontSize(
                    14,
                  ),
                  fontWeight: FontWeight.bold,
                  height: 1.20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    1.00,
                  ),
                ),
                child:ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                    _list.length,
                    itemBuilder: (context, index) {
                      StaffItemModel model = _list[index];
                      return StaffItemWidget(
                        model,
                      );
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
