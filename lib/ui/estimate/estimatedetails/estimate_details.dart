import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/estimate/estimate.dart';
import 'package:thikdr/ui/estimatequotation/estimate_quotation.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class EstimateDetailsPage extends StatefulWidget {
  @override
  State<EstimateDetailsPage> createState() => _EstimateDetailsState();
}

class _EstimateDetailsState extends State<EstimateDetailsPage> {
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
          "Estimate Details".toUpperCase(),
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
      body: Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
            width: double.infinity,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(
                      top: getVerticalSize(
                        18.00,
                      ),
                      bottom: getVerticalSize(
                        14.00,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        right: getHorizontalSize(
                          118.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              ImageConstant.imgVector78,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                77.00,
                              ),
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                1.00,
                              ),
                            ),
                            child: Text(
                              "msg_estimate_deatil".tr.toUpperCase(),
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
          ),*/
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    19.00,
                  ),
                  bottom: getVerticalSize(
                    20.00,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      4.19,
                    ),
                    right: getHorizontalSize(
                      2.20,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImageConstant.imgEstimateDetails,
                          height: getVerticalSize(
                              MediaQuery.of(context).size.height - 200),
                          /*width: getHorizontalSize(
                          407.61,
                        ),*/
                          fit: BoxFit.fill,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                             Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EstimatePage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              15.81,
                            ),
                            top: getVerticalSize(
                              33.00,
                            ),
                            right: getHorizontalSize(
                              12.80,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    140.00,
                                  ),
                                  top: getVerticalSize(
                                    18.00,
                                  ),
                                  bottom: getVerticalSize(
                                    19.00,
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
                                    15.00,
                                  ),
                                  right: getHorizontalSize(
                                    140.00,
                                  ),
                                  bottom: getVerticalSize(
                                    15.00,
                                  ),
                                ),
                                child: Text(
                                  "Add Estimate".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanbold131
                                      .copyWith(
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
