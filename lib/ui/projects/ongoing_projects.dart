import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/projects/widgets/onging_project_item_widget.dart';
import 'package:thikdr/ui/projectsummary/project_summary_page.dart';

import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';
import 'controller/onging_project_controller.dart';
import 'edit_project_page.dart';
import 'models/onging_project_item_model.dart';
import 'models/onging_project_model.dart';

class OngoingProjectPage extends StatefulWidget {

  @override
  State<OngoingProjectPage> createState() => _OngoingProjectState();
}

class _OngoingProjectState extends State<OngoingProjectPage> with TickerProviderStateMixin {

  //late TabController group159Controller;
  /*OngingProjectController controller =
  Get.put(OngingProjectController(OngingProjectModel().obs));*/

  List<OngingProjectModel> controller = [
    OngingProjectModel(""),
    OngingProjectModel(""),
    OngingProjectModel(""),
    OngingProjectModel(""),
  ];

  @override
  void initState() {
    super.initState();
    //group159Controller=Get.put(TabController(length: 2, vsync: this));
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  1.00,
                ),
              ),
              child:ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.length,
                  itemBuilder: (context, index) {
                    OngingProjectModel model = controller[index];
                    return OngingProjectItemWidget(
                      model,
                    );

                  },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: getVerticalSize(
                200.00,
              ),
              width: MediaQuery.of(context).size.width-15,
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  1.00,
                ),right: getHorizontalSize(
                  1.00,
                ),
                top: getVerticalSize(
                  8.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.deepOrange500,
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
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: ColorConstant.deepOrange500,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: getHorizontalSize(
                      1.00,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            4.00,
                          ),
                          top: getVerticalSize(
                            5.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                          bottom: getVerticalSize(
                            4.00,
                          ),
                        ),
                        child: Image.asset(
                          ImageConstant.imgBackground,
                          height: getSize(
                            186.00,
                          ),
                          width: getSize(
                            186.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            11.00,
                          ),
                          top: getVerticalSize(
                            8.00,
                          ),
                          right: getHorizontalSize(
                            15.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child: Image.asset(
                          ImageConstant.imgLogo,
                          height: getVerticalSize(
                            40.00,
                          ),
                          width: getHorizontalSize(
                            147.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            71.00,
                          ),
                          top: getVerticalSize(
                            10.00,
                          ),
                          right: getHorizontalSize(
                            71.00,
                          ),
                        ),
                        child: Image.asset(
                          ImageConstant.imgWhatismobile,
                          height: getVerticalSize(
                            134.00,
                          ),
                          width: getHorizontalSize(
                            236.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProjectPage()));
            },
            child:
          Container(
            margin: EdgeInsets.only(
              top: getVerticalSize(
                32.00,
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
                      10.00,
                    ),
                    width: getHorizontalSize(
                      5.00,
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
                      25.00,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        2.00,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        5.00,
                      ),
                      width: getSize(
                        2.00,
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
                      140.00,
                    ),
                    bottom: getVerticalSize(
                      10.00,
                    ),
                  ),
                  child: Text(
                    "ADD WORK",
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
    );
  }
}