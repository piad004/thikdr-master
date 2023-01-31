
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker/widgets/digger_item_widget.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'models/worker_item_model.dart';

class DiggerPage extends StatefulWidget {
  @override
  State<DiggerPage> createState() => _DiggerState();
}

class _DiggerState extends State<DiggerPage> {

  TextEditingController noteController = TextEditingController();

  List<WorkerItemModel> _list=[
    WorkerItemModel(''),
    WorkerItemModel('')
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray51,
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.gray51,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.gray40040,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                      onTap: (){
                      Navigator.pop(
                  context);
          },
            child:
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            20.00,
                          ),
                          top: getVerticalSize(
                            19.00,
                          ),
                          bottom: getVerticalSize(
                            28.00,
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
                            ImageConstant.imgBackBlack,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            50.00,
                          ),
                          top: getVerticalSize(
                            13.00,
                          ),
                          right: getHorizontalSize(
                            14.00,
                          ),
                          bottom: getVerticalSize(
                            14.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "Digger 3",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanregular161
                                    .copyWith(
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  height: 1.00,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  4.00,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,

                                padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),
                                    top:getVerticalSize(6),bottom: getVerticalSize(6)),
                                decoration: BoxDecoration(
                                  color: ColorConstant.lightBlue50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      45.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "₹ 400 per day | 6 hrs per shift",
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular106
                                      .copyWith(
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
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      10.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            23.00,
                          ),
                          top: getVerticalSize(
                            21.00,
                          ),
                          bottom: getVerticalSize(
                            20.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    6.00,
                                  ),
                                  right: getHorizontalSize(
                                    6.00,
                                  ),
                                ),
                                child: Text(
                                  "Total Work",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanbold143
                                      .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      height: 1.14,
                                      color: ColorConstant.black900),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    6.00,
                                  ),
                                ),
                                child: Text(
                                  "2",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanbold143
                                      .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      height: 1.14,
                                      color: ColorConstant.black900),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          34.00,
                        ),
                        width: getHorizontalSize(
                          1.00,
                        ),
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            31.00,
                          ),
                          top: getVerticalSize(
                            23.00,
                          ),
                          bottom: getVerticalSize(
                            22.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.gray300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            31.00,
                          ),
                          top: getVerticalSize(
                            21.00,
                          ),
                          bottom: getVerticalSize(
                            20.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    13.00,
                                  ),
                                  right: getHorizontalSize(
                                    13.00,
                                  ),
                                ),
                                child: Text(
                                  "Total Salary",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanbold143
                                      .copyWith(
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    height: 1.14,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    6.00,
                                  ),
                                ),
                                child: Text(
                                  "Rs. 4,450",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanbold143
                                      .copyWith(
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    height: 1.14,
                                  ),
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
                width: size.width,
                  padding: EdgeInsets.only(
                    top: getVerticalSize(
                      19.00,
                    ),
                    left: getHorizontalSize(20),
                    right: getHorizontalSize(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            4.00,
                          ),
                          top: getVerticalSize(
                            6.00,
                          ),
                          right: getHorizontalSize(
                            7.00,
                          ),
                          bottom: getVerticalSize(
                            5.00,
                          ),
                        ),
                        child: Text(
                          "Date",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle
                              .textstylerobotoromanregular108
                              .copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.00,
                              color: ColorConstant.black900
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            4.00,
                          ),
                          top: getVerticalSize(
                            6.00,
                          ),
                          right: getHorizontalSize(
                            7.00,
                          ),
                          bottom: getVerticalSize(
                            5.00,
                          ),
                        ),
                        child: Text(
                          "Attendance",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle
                              .textstylerobotoromanregular108
                              .copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.00,
                              color: ColorConstant.black900
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    15.00,
                  ),
                  right: getHorizontalSize(
                    15.00,
                  ),
                ),
                child:  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    WorkerItemModel model = _list[index];
                    return DiggerItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}