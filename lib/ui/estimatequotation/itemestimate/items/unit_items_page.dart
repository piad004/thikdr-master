
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/widgets/unit_items_item_widget.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'models/unit_items_item_model.dart';
import 'models/unit_items_model.dart';

class UnitItemsPage extends StatefulWidget {
  @override
  State<UnitItemsPage> createState() => _UnitItemsState();
}

class _UnitItemsState extends State<UnitItemsPage> {

  TextEditingController searchUnitController = TextEditingController();

  final List<UnitItemsModel> unitItemsModelObj = [
    UnitItemsModel('Job/Leads'),
    UnitItemsModel('Job/Leads'),
    UnitItemsModel('Job/Leads'),
    UnitItemsModel('Job/Leads'),
    UnitItemsModel('Job/Leads'),
    UnitItemsModel('Job/Leads'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  1.00,
                ),
                right: getHorizontalSize(
                  1.00,
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
                      2,
                    ),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        12.00,
                      ),
                      top: getVerticalSize(
                        30.00,
                      ),
                      right: getHorizontalSize(
                        9.00,
                      ),
                      bottom: getVerticalSize(
                        25.00,
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(
                        46.00,
                      ),
                      width: getHorizontalSize(
                        size.width,
                      ),
                      child: TextFormField(
                        controller: searchUnitController,
                        decoration: InputDecoration(
                          hintText: "Search Unit",
                          hintStyle:
                          AppStyle.textstylerobotoromanregular147.copyWith(
                            fontSize: getFontSize(
                              14.0,
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
                                18.00,
                              ),
                            ),
                            child: Container(
                              height: getSize(
                                16.00,
                              ),
                              width: getSize(
                                16.00,
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
                              15.00,
                            ),
                            top: getVerticalSize(
                              9.00,
                            ),
                            bottom: getVerticalSize(
                              9.00,
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
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getVerticalSize(
                16.00,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: getVerticalSize(
                        32.00,
                      ),
                      width: getHorizontalSize(
                        size.width/2-5,
                      ),
                      decoration: AppDecoration.textstylerobotoromanbold149,
                      child: Text(
                        "Set Conversion",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold149.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 0.57,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: getVerticalSize(
                        32.00,
                      ),
                      width: getHorizontalSize(
                        size.width/2-5,
                      ),
                      decoration: AppDecoration.textstylerobotoromanbold148,
                      child: Text(
                        "Unit to Items",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold148.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
                          height: 0.57,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: getVerticalSize(
                    4.00,
                  ),
                  width: getHorizontalSize(
                    size.width,
                  ),
                  margin: EdgeInsets.only(
                    right: getHorizontalSize(
                      1.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.gray100,
                  ),
                ),
              ],
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
                  18.00,
                ),
              ),
              child:  ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: unitItemsModelObj.length,
                  itemBuilder: (context, index) {
                    UnitItemsModel model = unitItemsModelObj[index];
                    return UnitItemsItemWidget(
                      model,
                    );
                  },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: getHorizontalSize(
                96.00,
              ),
              top: getVerticalSize(
                16.00,
              ),
              right: getHorizontalSize(
                96.00,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      39.00,
                    ),
                    top: getVerticalSize(
                      15.00,
                    ),
                    bottom: getVerticalSize(
                      16.00,
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
                      7.00,
                    ),
                    top: getVerticalSize(
                      12.00,
                    ),
                    right: getHorizontalSize(
                      39.00,
                    ),
                    bottom: getVerticalSize(
                      12.00,
                    ),
                  ),
                  child: Text(
                    "ADD UNIT",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanbold131.copyWith(
                      fontSize: getFontSize(
                        15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}