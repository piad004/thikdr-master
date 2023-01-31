import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/leads/leadstab/latestleads/latestleadpage.dart';
import 'package:thikdr/ui/leads/leadstab/myleads/my_leads.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import 'models/leads1_model.dart';


class LeadsTabPage extends StatefulWidget {
  @override
  State<LeadsTabPage> createState() => _LeadsTabState();
}

class _LeadsTabState extends State<LeadsTabPage>  with TickerProviderStateMixin  {

  Rx<Leads1Model> leads1ModelObj = Leads1Model().obs;

  late TabController group178Controller;

  @override
  void initState() {
    super.initState();
    group178Controller =
        Get.put(TabController(vsync: this, length: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorConstant.red900,
                  ColorConstant.deepOrange400De,
                ], stops: [0.5, 1.0],
              ),
            ),
          ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Leads".toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style:
          AppStyle.textstylerobotobold20.copyWith(
            fontSize: getFontSize(
              20,
            ),
            height: 0.80,
          ),
        ),
        backgroundColor: Colors.white,
      ),
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             /* Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(
                        0.008,
                        0.0283,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: size.width,
                          margin: EdgeInsets.only(
                            top: getVerticalSize(
                              19.00,
                            ),
                            bottom: getVerticalSize(
                              13.00,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                20.00,
                              ),
                              right: getHorizontalSize(
                                177.00,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: getSize(
                                    20.00,
                                  ),
                                  width: getSize(
                                    20.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgBack,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      2.00,
                                    ),
                                    bottom: getVerticalSize(
                                      2.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Leads".tr.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                    AppStyle.textstylerobotobold20.copyWith(
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      height: 0.80,
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
                ),
              ),*/
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        1.00,
                      ),
                      bottom: getVerticalSize(
                        1.00,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          10.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DefaultTabController(  // Added
                                length: 2,  // Added
                                initialIndex: 0, //Added
                                child:
                              Container(
                                width: MediaQuery.of(context).size.width-40,
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                child: TabBar(
                                  controller: this.group178Controller,
                                  tabs: [
                                    Tab(
                                      text: "Latest leads",
                                    ),
                                    Tab(
                                      text: "My Leads",
                                    ),
                                  ],
                                  labelColor: ColorConstant.teal400,
                                  unselectedLabelColor: ColorConstant.gray701,
                                  indicator: BoxDecoration(
                                    color: ColorConstant.lightBlue100,
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
                                  4.00,
                                ),
                                width: getHorizontalSize(
                                  MediaQuery.of(context).size.width,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray100,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: getVerticalSize(
                                10.00,
                              ),
                            ),
                            height: MediaQuery.of(context).size.height-170,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: this.group178Controller,
                              children: [
                                LatestLeadsPage(),
                                MyLeadsPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}