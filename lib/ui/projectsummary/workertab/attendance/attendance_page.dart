import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/workertab/attendance/addworker/add_worker_bottomsheet.dart';
import 'package:thikdr/ui/projectsummary/workertab/attendance/models/attendance_item_model.dart';
import 'package:thikdr/ui/projectsummary/workertab/attendance/widgets/attendance_item_widget.dart';

import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';

class AttendancePage extends StatefulWidget {
  @override
  State<AttendancePage> createState() => _AttendanceState();
}

class _AttendanceState extends State<AttendancePage> {
  TextEditingController searchController = TextEditingController();

  List<AttendanceItemModel> _list =[
    AttendanceItemModel(""),
    AttendanceItemModel(""),
    AttendanceItemModel(""),
    AttendanceItemModel(""),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.red900,
                ColorConstant.deepOrange400De,
              ],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "ATTENDANCE",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle.textstylerobotobold20.copyWith(
            fontSize: getFontSize(
              20,
            ),
            height: 0.80,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(25),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 45,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    5.00,
                  ),
                  top: getVerticalSize(
                    5.00,
                  ),
                  right: getHorizontalSize(
                    5.00,
                  ),
                ),
                child: Container(
                  width: size.width,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            2.00,
                          ),
                          bottom: getVerticalSize(
                            2.00,
                          ),
                        ),
                        child: Container(
                          height: getSize(
                            19.00,
                          ),
                          width: getSize(
                            12.00,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.imgArrowBackWhite,
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
                            2.00,
                          ),
                          right: getHorizontalSize(
                            5.00,
                          ),
                          bottom: getVerticalSize(
                            2.00,
                          ),
                        ),
                        child:
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: getHorizontalSize(10),bottom: getVerticalSize(5)),
                            padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(6),top: getVerticalSize(6)),
                            decoration: BoxDecoration(
                              color: ColorConstant.red400,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  20.00,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: getHorizontalSize(5)),
                                  height: getSize(
                                    14.00,
                                  ),
                                  width: getSize(
                                    12.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgCalendarWhite1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  "22 July, 2022",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanregular102.copyWith(
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    height: 1.20,
                                    color: ColorConstant.whiteA700,
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            10.00,
                          ),
                          top: getVerticalSize(
                            2.00,
                          ),
                          bottom: getVerticalSize(
                            2.00,
                          ),
                        ),
                        child: Container(
                          height: getSize(
                            19.00,
                          ),
                          width: getSize(
                            12.00,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.imgArrowRightWhite,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Column(
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
                      child: Container(
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
                  20.00,
                ),
                right: getHorizontalSize(
                  15.00,
                ),
              ),
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  5.00,
                ),
                bottom: getVerticalSize(
                  5.00,
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
                          10.00,
                        ),
                        top: getVerticalSize(
                          7.00,
                        ),
                        bottom: getVerticalSize(
                          7.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
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
                        "Work Type",
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
                  Padding(
                    padding: EdgeInsets.only(
                      right: getHorizontalSize(
                        10.00,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          10.00,
                        ),
                        top: getVerticalSize(
                          7.00,
                        ),
                        bottom: getVerticalSize(
                          7.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
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
                        "Attendance",
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
          Container(
            margin: EdgeInsets.only(top:getVerticalSize(20),left: getHorizontalSize(20),right: getHorizontalSize(20)),
            height: getVerticalSize(
              44.00,
            ),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search here...",
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
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  1.00,
                ),
                top: getVerticalSize(
                  10.00,
                ),
              ),
              child:ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                _list.length,
                itemBuilder: (context, index) {
                  AttendanceItemModel model = _list[index];
                  return AttendanceItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: (){
            /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProjectSummaryPage()));*/
              showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isScrollControlled: true,
                  builder: (context) {
                    return AddWorkerBottomsheet(
                    );
                  });
            },
            child:
            Container(
              margin: EdgeInsets.only(
                top: getVerticalSize(
                  60.00,
                ),
                left: getHorizontalSize(
                  10.00,
                ),
                right: getHorizontalSize(
                  10.00,
                ),
              ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        142.00,
                      ),
                      top: getVerticalSize(
                        16.00,
                      ),
                      bottom: getVerticalSize(
                        18.00,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        11.00,
                      ),
                      width: getHorizontalSize(
                        14.00,
                      ),
                      child: SvgPicture.asset(
                        ImageConstant.imgPeople,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        11.00,
                      ),
                      top: getVerticalSize(
                        19.00,
                      ),
                      bottom: getVerticalSize(
                        18.00,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        3.00,
                      ),
                      top: getVerticalSize(
                        16.00,
                      ),
                      right: getHorizontalSize(
                        137.00,
                      ),
                      bottom: getVerticalSize(
                        14.00,
                      ),
                    ),
                    child: Text(
                      "ADD WORKER",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanbold131.copyWith(
                        fontSize: getFontSize(
                          13,
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
    ));
  }
}
