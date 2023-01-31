import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/product_items_page.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/unit_items_page.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<ItemsPage> createState() => _ItemsState();
}

class _ItemsState extends State<ItemsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    this._tabController =
    (TabController(vsync: this, length: 3));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
          "Items".toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle.textstylerobotobold20.copyWith(
            fontSize: getFontSize(
              20,
            ),
            height: 0.80,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstant.whiteA700,
      /*bottomSheet: Padding(
        padding: EdgeInsets.only(
          bottom: getVerticalSize(
            10.00,
          ),
          left: getHorizontalSize(10),
          right: getHorizontalSize(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              height: getVerticalSize(
                45.00,
              ),
              width: getHorizontalSize(
                MediaQuery.of(context).size.width / 2,
              ),
              decoration: AppDecoration.textstylerobotoromanbold13,
              child: Text(
                "Save & new",
                textAlign: TextAlign.left,
                style: AppStyle.textstylerobotoromanbold13.copyWith(
                  fontSize: getFontSize(
                    15,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: getVerticalSize(
                45.00,
              ),
              width: getHorizontalSize(
                MediaQuery.of(context).size.width / 2,
              ),
              decoration: AppDecoration.textstylerobotoromanbold13,
              child: Text(
                "Save",
                textAlign: TextAlign.left,
                style: AppStyle.textstylerobotoromanbold13.copyWith(
                  fontSize: getFontSize(
                    15,
                  ),
                ),
              ),
            ),
          ],
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            ImageConstant.imgBaseBg,
                            height: getVerticalSize(
                              130.00,
                            ),
                            width: getHorizontalSize(
                             double.infinity,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child:
                        Container(
                          width: getHorizontalSize(
                            double.infinity,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              10.00,
                            ),
                            top: getVerticalSize(
                              20.00,
                            ),
                            right: getHorizontalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              15.00,
                            ),
                          ),
                          child: TabBar(
                            controller: this._tabController,
                            tabs: [
                              Tab(
                                text: "Products".toUpperCase(),
                              ),
                              Tab(
                                text: "Services".toUpperCase(),
                              ),
                              Tab(
                                text: "Unit".toUpperCase(),
                              ),
                            ],
                            labelColor: ColorConstant.whiteA700,
                            unselectedLabelColor: ColorConstant.whiteA700,
                            indicator: BoxDecoration(
                              color: ColorConstant.redA400,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  16.00,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                21.00,
                              ),
                              right: getHorizontalSize(
                                16.00,
                              ),
                              bottom: getVerticalSize(
                                4.00,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    size.height-40,
                                  ),
                                  child: TabBarView(
                                    controller: this._tabController,
                                    children: [
                                      ProductItemsPage(),
                                      ProductItemsPage(),
                                      UnitItemsPage(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
