import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikdr/ui/projectsummary/job/job_page.dart';
import 'package:thikdr/ui/projectsummary/material/project_material_page.dart';
import 'package:thikdr/ui/projectsummary/payment/payment_page.dart';
import 'package:thikdr/ui/projectsummary/photo/photo_page.dart';
import 'package:thikdr/ui/projectsummary/summary/summary_page.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker_tab_page.dart';

import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/math_utils.dart';

class ProjectSummaryPage extends StatefulWidget {
  @override
  State<ProjectSummaryPage> createState() => _ProjectSummaryState();
}

class _ProjectSummaryState extends State<ProjectSummaryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = <Tab>[
    const Tab(text: 'SUMMARY'),
    const Tab(text: 'PAYMENT'),
    const Tab(text: 'WORKER'),
    const Tab(text: 'MATERIAL'),
    const Tab(text: 'JOB'),
    const Tab(text: 'PHOTO'),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

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
          "Project Summary".toUpperCase(),
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
          preferredSize: const Size.fromHeight(20),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 30,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              tabs: _tabs,
              controller: _tabController,
              labelStyle: AppStyle.textstylerobotoromanregular1413,
              //For Selected tab
              unselectedLabelStyle: AppStyle.textstylerobotoromanregular1413,
              //For Un-selected Tabs
              //indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ColorConstant.whiteA700,
              //unselectedLabelColor: ColorConstant.gray701,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                  bottomRight: Radius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: [
            SummaryPage(),
            PaymentPage(),
            WorkerTabPage(),
            ProjectMaterialPage(),
            JobPage(),
            PhotoPage(),
          ],
        ),
      ),
      /* Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        33.00,
                      ),
                      bottom: getVerticalSize(
                        20.00,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        right: getHorizontalSize(
                          14.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorConstant.red900,
                                    ColorConstant.deepOrange400De,
                                  ],
                                  stops: [0.5, 1.0],
                                ),
                              ),
                              child:

                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddUsedMaterialPage()));
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    4.00,
                                  ),
                                  top: getVerticalSize(
                                    15.00,
                                  ),
                                  right: getHorizontalSize(
                                    2.33,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: getSize(
                                            36.00,
                                          ),
                                          width: getSize(
                                            36.00,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgCar,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              13.00,
                                            ),
                                            top: getVerticalSize(
                                              10.00,
                                            ),
                                            bottom: getVerticalSize(
                                              10.00,
                                            ),
                                          ),
                                          child: Text(
                                            "Add New Material",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanbold167
                                                .copyWith(
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              height: 1.00,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          10.48,
                                        ),
                                        bottom: getVerticalSize(
                                          9.78,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          15.74,
                                        ),
                                        width: getHorizontalSize(
                                          8.20,
                                        ),
                                        child: SvgPicture.asset(
                                          ImageConstant.imgRightArrow,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  2.00,
                                ),
                                top: getVerticalSize(
                                  20.00,
                                ),
                              ),
                              child: (materialLibraryModelObj.length == 0)
                                  ? Text("No data found!")
                                  : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: materialLibraryModelObj.length,
                                itemBuilder: (context, index) {
                                  MaterialLibraryItemModel model =
                                  materialLibraryModelObj[index];
                                  return MateriallistItemWidget(
                                    model,
                                  );
                                },
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
          ),*/
    ));
  }
}
