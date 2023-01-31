
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import 'models/Job_item_model.dart';
import 'widgets/job_item_widget.dart';

class JobPage extends StatefulWidget {
  @override
  State<JobPage> createState() => _JobState();
}

class _JobState extends State<JobPage> {

  final List<JobItemModel> _list = [
    JobItemModel(''),
    JobItemModel( ''),
    JobItemModel(''),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: getVerticalSize(
                90.00,
              ),
              width: size.width,
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  0.00,
                ),
                top: getVerticalSize(
                  0,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: getVerticalSize(
                          10.00,
                        ),
                      ),
                      child:
                      Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          60.00,
                        ),
                        width: getHorizontalSize(
                          double.infinity,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              0.00,
                            ),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment(
                              0.008,
                              0.029,
                            ),
                            end: Alignment(
                              1,
                              1,
                            ),
                            colors: [
                              ColorConstant.red900,
                              ColorConstant.deepOrange400De,
                            ],
                          ),
                        ),
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
                              2.00,
                            ),
                            blurRadius: getHorizontalSize(
                              2.00,
                            ),
                            offset: Offset(
                              0,
                              4,
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: Expanded(flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          6.00,
                                        ),
                                        right: getHorizontalSize(
                                          6.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Delayed",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanbold143
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 0.80,
                                        ),
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
                                      "3",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanbold143
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        height: 0.80,
                                      ),
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
                                      "On Track",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanbold144
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        height: 0.80,
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
                                      "3",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanbold144
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
                          Container(
                            height: getVerticalSize(
                              34.00,
                            ),
                            width: getHorizontalSize(
                              1.00,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                27.00,
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

                          Expanded(flex: 1,
                            child: Container(
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
                                        "Completed",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanbold145
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 0.80,
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
                                        "1",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanbold145
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  15.00,
                ),
                top: getVerticalSize(
                  25.00,
                ),
                right: getHorizontalSize(
                  15.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.deepOrange400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
                  bottomRight: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
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
                        10.00,
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
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Starts",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        0.00,
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
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Task Name",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        0.00,
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
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Ends",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        0.00,
                      ),
                      top: getVerticalSize(
                        5.00,
                      ),
                      right: getHorizontalSize(
                        10.00,
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
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Progress",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136.copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
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
                  16.00,
                ),
                top: getVerticalSize(
                  5.00,
                ),
                right: getHorizontalSize(
                  16.00,
                ),
              ),
              child:
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                _list.length,
                itemBuilder: (context, index) {
                  JobItemModel model =
                  _list[index];
                  return JobItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  16.00,
                ),
                top: getVerticalSize(
                  54.00,
                ),
                right: getHorizontalSize(
                  16.00,
                ),
              ),
              child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(
                      0.008,
                      0.029,
                    ),
                    end: Alignment(
                      1,
                      1,
                    ),
                    colors: [
                      ColorConstant.red900,
                      ColorConstant.deepOrange400De,
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          80.00,
                        ),
                        top: getVerticalSize(
                          19.00,
                        ),
                        bottom: getVerticalSize(
                          18.00,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8.00,
                        ),
                        width: getSize(
                          8.00,
                        ),
                        child: SvgPicture.asset(
                          ImageConstant.imgPlus,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          5.00,
                        ),
                        top: getVerticalSize(
                          15.00,
                        ),
                        right: getHorizontalSize(
                          80.00,
                        ),
                        bottom: getVerticalSize(
                          14.00,
                        ),
                      ),
                      child: Text(
                        "ADD NEW TASK",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                        AppStyle.textstylerobotoromanbold141.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}