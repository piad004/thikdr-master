
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/photo/models/photo_item_model.dart';
import 'package:thikdr/ui/projectsummary/photo/widgets/photo_item_widget.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class PhotoPage extends StatefulWidget {
  @override
  State<PhotoPage> createState() => _PhotoState();
}

class _PhotoState extends State<PhotoPage> {

  final List<PhotoItemModel> _list = [
    PhotoItemModel(''),
    PhotoItemModel( ''),
    PhotoItemModel(''),
    PhotoItemModel(''),
    PhotoItemModel(''),
    PhotoItemModel(''),
    PhotoItemModel(''),
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
                      /* Image.asset(
                        ImageConstant.imgBaseBg,
                        height: getVerticalSize(
                          60.00,
                        ),
                        width: getHorizontalSize(
                          double.infinity,
                        ),
                        fit: BoxFit.fill,
                      ),*/
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
                                      "Albums",
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
                                      "Site Photo",
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
                                      "1",
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
                        "Site Photos",
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
                        "View All >",
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
              child:
              Padding(
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
              child:
              ListView.builder(
               // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:
                _list.length,
                itemBuilder: (context, index) {
                  PhotoItemModel model =
                  _list[index];
                  return Container(width: 100,child: PhotoItemWidget(
                    model,
                  ),);
                },
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
                        "Sample Drawing",
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
                        "View All >",
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
              child:
              Padding(
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
              child:
              ListView.builder(
               // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:
                _list.length,
                itemBuilder: (context, index) {
                  PhotoItemModel model =
                  _list[index];
                  return Container(width: 100,child: PhotoItemWidget(
                    model,
                  ),);
                },
              ),

            ),
          ),
        ],
      ),
    );
  }
}
