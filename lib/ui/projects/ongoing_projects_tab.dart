import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/projects/ongoing_projects.dart';

import '../../network/webservice.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';
import '../../utils/utils.dart';
import '../../utils/pref_utils.dart';
import '../home/model/slider/slider_model.dart';

class OngoingProjectTabPage extends StatefulWidget {
  @override
  State<OngoingProjectTabPage> createState() => _OngoingProjectTabState();
}

class _OngoingProjectTabState extends State<OngoingProjectTabPage> with SingleTickerProviderStateMixin {

   late TabController tabController;
   var userName="Hi ";

  @override
  void initState() {
    super.initState();
    getUserData();
    this.tabController=(TabController(length: 2, vsync: this));
  }


   Future<void> getUserData() async {
       var user_name = await PrefUtils().getPreferencesData(Utils().user_name);
         setState(() {
           userName = "Hi, "+user_name.toString();
         });
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
       /* bottomNavigationBar:   Container(
          width: MediaQuery.of(context).size.width-40,
          margin: EdgeInsets.only(
            left: getHorizontalSize(
              22.00,
            ),
            top: getVerticalSize(
              12.00,
            ),
            right: getHorizontalSize(
              22.00,
            ),
          ),
          child: TabBar(
            controller: this.tabController,
            tabs: [
              Tab(
                text: "Ongoing Project",
              ),
              Tab(
                text: "Past Project",
              ),
            ],
            labelColor: ColorConstant.whiteA700,
            unselectedLabelColor: ColorConstant.gray701,
            indicator: BoxDecoration(
              color: ColorConstant.deepOrange601,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  getHorizontalSize(
                    15.00,
                  ),
                ),
                topRight: Radius.circular(
                  getHorizontalSize(
                    15.00,
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
          ),
        ),*/
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: getVerticalSize(
                      0,
                    ),
                  ),
                  decoration: BoxDecoration(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          120,
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            20.00,
                          ),
                          right: getHorizontalSize(
                            4.00,
                          ),
                          top:5
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  bottom: getVerticalSize(
                                    5.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    100.00,
                                  ),
                                  width: getHorizontalSize(
                                    200.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgBgsvg1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    100.00,
                                  ),
                                  width: getHorizontalSize(
                                    110.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgWorker1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: getHorizontalSize(
                                    10.00,
                                  ),
                                  bottom: getVerticalSize(
                                    5.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                1,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                getSize(
                                                  26.00,
                                                ),
                                              ),
                                              child: Image.asset(
                                                ImageConstant.imgUser1,
                                                height: getSize(
                                                  52.00,
                                                ),
                                                width: getSize(
                                                  52.00,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: getVerticalSize(
                                                20.00,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: getVerticalSize(
                                                      2.00,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    height: getVerticalSize(
                                                      20,
                                                    ),
                                                    width: getHorizontalSize(
                                                      20.00,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      ImageConstant
                                                          .imgQuestionMark,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      5.00,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    height: getVerticalSize(
                                                      21.34,
                                                    ),
                                                    width: getHorizontalSize(
                                                      24.00,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      ImageConstant.imgPlay1,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          1.00,
                                        ),
                                        top: getVerticalSize(
                                          15.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        userName,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotobold20
                                            .copyWith(
                                          fontSize: getFontSize(
                                            20,
                                          ),
                                          height: 0.80,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: getVerticalSize(
                                          5.00,
                                        ),
                                        right: getHorizontalSize(
                                          4.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Which project are you working on today?",
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanregular1413
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 1.1,
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
                      DefaultTabController(
                        length: 2,
                        child:
                      Container(
                        width: MediaQuery.of(context).size.width-50,
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            22.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          right: getHorizontalSize(
                            22.00,
                          ),
                        ),
                        child: TabBar(
                          controller: this.tabController,
                          tabs: [
                            Tab(
                              text: "Ongoing Project",
                            ),
                            Tab(
                              text: "Past Project",
                            ),
                          ],
                          labelColor: ColorConstant.whiteA700,
                          unselectedLabelColor: ColorConstant.gray701,
                          indicator: BoxDecoration(
                            color: ColorConstant.deepOrange601,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                getHorizontalSize(
                                  15.00,
                                ),
                              ),
                              topRight: Radius.circular(
                                getHorizontalSize(
                                  15.00,
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
                        ),
                      ),
                      ),
                      Container(
                        height: getVerticalSize(
                          0,
                        ),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: ColorConstant.gray100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      5.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                    bottom: getVerticalSize(
                      2.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                  ),
                  child: DefaultTabController(
                   /* mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [*/
                    length: 2,
                    child:
                      Container(
                        height: (MediaQuery.of(context).size.height)/1.35,
                        child: TabBarView(
                          controller: this.tabController,
                          children: [
                            OngoingProjectPage(),
                            OngoingProjectPage(),
                          ],
                        ),
                      ),
                      ),
                    //],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

/*
  Widget tabbar() => TabBar(

    controller: tabController,
    onTap: (value) {
      setState(() {
        selectedTabIndex = value;
      });
    },
    tabs: [
      Text("tab one"),
      Text("tab two"),
    ],
  );*/
}