import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/addproduct/widgets/add_product_item_widget.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import 'models/add_product_item_model.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductPage>
    with TickerProviderStateMixin {
  TextEditingController itemcodeBarController = TextEditingController();
  TextEditingController taxRateController = TextEditingController();

  final List<AddProductItemModel> addProductModelObj = [
    AddProductItemModel('Sale'),
    AddProductItemModel('Job/Leads'),
  ];

  var currentRating = false;

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
          "Add Product".toUpperCase(),
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
                    0.007246369447891643,
                    0.0282051559055434,
                  ),
                  end: Alignment(
                    0.9939613230808374,
                    0.9999999704819924,
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
                          17.00,
                        ),
                        bottom: getVerticalSize(
                          11.00,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            20.00,
                          ),
                          right: getHorizontalSize(
                            13.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  1.00,
                                ),
                                bottom: getVerticalSize(
                                  3.00,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: getSize(
                                      20.00,
                                    ),
                                    width: getSize(
                                      20.00,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgVector101,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        7.00,
                                      ),
                                      top: getVerticalSize(
                                        3.00,
                                      ),
                                      bottom: getVerticalSize(
                                        1.00,
                                      ),
                                    ),
                                    child: Text(
                                      "lbl_add_product".tr.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotobold19
                                          .copyWith(
                                        fontSize: getFontSize(
                                          19,
                                        ),
                                        height: 0.84,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      4.00,
                                    ),
                                    bottom: getVerticalSize(
                                      4.00,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      16.00,
                                    ),
                                    width: getHorizontalSize(
                                      18.00,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgVector102,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      6.00,
                                    ),
                                  ),
                                  child: Container(
                                    height: getSize(
                                      24.00,
                                    ),
                                    width: getSize(
                                      24.00,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgSetting2,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
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
                  bottom: getVerticalSize(
                    25.00,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      21.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
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
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.gray5004f,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    10.00,
                                  ),
                                  bottom: getVerticalSize(
                                    10.00,
                                  ),
                                ),
                                child: Text(
                                  "Product",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1212
                                      .copyWith(
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    height: 1.33,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    11.00,
                                  ),
                                  bottom: getVerticalSize(
                                    12.00,
                                  ),
                                ),
                                child: Switch(
                                  value: currentRating,
                                  inactiveTrackColor:
                                      ColorConstant.deepOrange400,
                                  inactiveThumbColor: ColorConstant.whiteA700,
                                  onChanged: (rating) {
                                    setState(() {
                                      currentRating = rating;
                                    });
                                  },
                                ),
                              ),
                              Padding(
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
                                  bottom: getVerticalSize(
                                    10.00,
                                  ),
                                ),
                                child: Text(
                                  "Services",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1213
                                      .copyWith(
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    height: 1.33,
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
                            1.00,
                          ),
                        ),
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
                                  color: ColorConstant.gray101,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            14.00,
                                          ),
                                          top: getVerticalSize(
                                            15.00,
                                          ),
                                          right: getHorizontalSize(
                                            14.00,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              25.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: ColorConstant.bluegray100,
                                            width: getHorizontalSize(
                                              1.00,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
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
                                              child: Text(
                                                "Sand",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular16
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  12.00,
                                                ),
                                                right: getHorizontalSize(
                                                  14.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  14.00,
                                                ),
                                              ),
                                              child: Text(
                                                "Edit Unit",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular1214
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  height: 1.33,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          14.00,
                                        ),
                                        top: getVerticalSize(
                                          10.00,
                                        ),
                                        right: getHorizontalSize(
                                          14.00,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          46.00,
                                        ),
                                        width: getHorizontalSize(
                                          MediaQuery.of(context).size.width,
                                        ),
                                        child: TextFormField(
                                          controller: itemcodeBarController,
                                          decoration: InputDecoration(
                                            hintText: "Item code / Barcode",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: getFontSize(
                                                16.0,
                                              ),
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color:
                                                    ColorConstant.bluegray100,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  25.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color:
                                                    ColorConstant.bluegray100,
                                                width: 1,
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
                                                14.00,
                                              ),
                                              bottom: getVerticalSize(
                                                14.00,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.gray500,
                                            fontSize: getFontSize(
                                              16.0,
                                            ),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            14.00,
                                          ),
                                          top: getVerticalSize(
                                            10.00,
                                          ),
                                          right: getHorizontalSize(
                                            14.00,
                                          ),
                                          bottom: getVerticalSize(
                                            16.00,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              45.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: ColorConstant.gray301,
                                            width: getHorizontalSize(
                                              1.00,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  10.00,
                                                ),
                                                top: getVerticalSize(
                                                  18.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  18.00,
                                                ),
                                              ),
                                              child: Text(
                                                "HSN / SAC Code",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular149
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  height: 0.57,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: getVerticalSize(
                                                  8.00,
                                                ),
                                                right: getHorizontalSize(
                                                  15.00,
                                                ),
                                                bottom: getVerticalSize(
                                                  8.00,
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
                                                  fit: BoxFit.fill,
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
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  30.00,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: getVerticalSize(
                                          32.00,
                                        ),
                                        width: getHorizontalSize(
                                          170.00,
                                        ),
                                        decoration: AppDecoration
                                            .textstylerobotoromanbold148,
                                        child: Text(
                                          "Pricing",
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold148
                                              .copyWith(
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
                                          170.00,
                                        ),
                                        decoration: AppDecoration
                                            .textstylerobotoromanbold149,
                                        child: Text(
                                          "Stock",
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanbold149
                                              .copyWith(
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
                                      378.00,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top:getVerticalSize(20)),child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:10,bottom: 5),
                                alignment: Alignment.centerLeft,
                                height: getVerticalSize(
                                  46.00,
                                ),
                                width: getHorizontalSize(
                                  MediaQuery.of(context).size.width/2,
                                ),
                                decoration: AppDecoration
                                    .textstylerobotoromanregular1410,
                                child: Text(
                                  "Sale Price",
                                  textAlign: TextAlign.center,
                                  style: AppStyle
                                      .textstylerobotoromanregular1410
                                      .copyWith(
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    height: 1.54,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      25.00,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.bluegray100,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          16.00,
                                        ),
                                        top: getVerticalSize(
                                          15.00,
                                        ),
                                        bottom: getVerticalSize(
                                          15.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Tax Excluded",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanregular149
                                            .copyWith(
                                          fontSize: getFontSize(
                                            15,
                                          ),
                                          height: 1.14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          38.64,
                                        ),
                                        top: getVerticalSize(
                                          14.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.49,
                                        ),
                                        bottom: getVerticalSize(
                                          13.53,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          8.47,
                                        ),
                                        width: getHorizontalSize(
                                          15.87,
                                        ),
                                        child: SvgPicture.asset(
                                          ImageConstant.imgArrowDown,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),),
                          Padding(padding: EdgeInsets.only(top:getVerticalSize(20)),child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:10,bottom: 5),
                                alignment: Alignment.centerLeft,
                                height: getVerticalSize(
                                  46.00,
                                ),
                                width: getHorizontalSize(
                                  MediaQuery.of(context).size.width/2,
                                ),
                                decoration: AppDecoration
                                    .textstylerobotoromanregular1410,
                                child: Text(
                                  "Purchase Price",
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular1410
                                      .copyWith(
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    height: 1.54,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      25.00,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.bluegray100,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          16.00,
                                        ),
                                        top: getVerticalSize(
                                          15.00,
                                        ),
                                        bottom: getVerticalSize(
                                          15.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Tax Excluded".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanregular149
                                            .copyWith(
                                          fontSize: getFontSize(
                                            15,
                                          ),
                                          height: 1.14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          38.64,
                                        ),
                                        top: getVerticalSize(
                                          14.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.49,
                                        ),
                                        bottom: getVerticalSize(
                                          13.53,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          8.47,
                                        ),
                                        width: getHorizontalSize(
                                          15.87,
                                        ),
                                        child: SvgPicture.asset(
                                          ImageConstant.imgArrowDown,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              /*height: getVerticalSize(
                                173.00,
                              ),*/
                              width: getHorizontalSize(
                                MediaQuery.of(context).size.width,
                              ),
                              margin: EdgeInsets.only(
                                top: getVerticalSize(
                                  10.00,
                                ),
                                left: getHorizontalSize(
                                  1.00,
                                ),
                                right: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        5.00,
                                      ),
                                      top: getVerticalSize(
                                        10.00,
                                      ),
                                      right: getHorizontalSize(
                                        8.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        46.00,
                                      ),
                                      width: getHorizontalSize(
                                       MediaQuery.of(context).size.width,
                                      ),
                                      child: TextFormField(
                                        controller: taxRateController,
                                        decoration: InputDecoration(
                                          hintText: "Tax Rate",
                                          hintStyle: AppStyle
                                              .textstylerobotoromanregular149
                                              .copyWith(
                                            fontSize: getFontSize(
                                              15.0,
                                            ),
                                            color: ColorConstant.gray500,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                25.00,
                                              ),
                                            ),
                                            borderSide: BorderSide(
                                              color: ColorConstant.bluegray100,
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                25.00,
                                              ),
                                            ),
                                            borderSide: BorderSide(
                                              color: ColorConstant.bluegray100,
                                              width: 1,
                                            ),
                                          ),
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                10.00,
                                              ),
                                              right: getHorizontalSize(
                                                10.49,
                                              ),
                                            ),
                                            child: Container(
                                              height: getSize(
                                                8.47,
                                              ),
                                              width: getSize(
                                                15.87,
                                              ),
                                              child: SvgPicture.asset(
                                                ImageConstant.imgArrowDown,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          suffixIconConstraints: BoxConstraints(
                                            minWidth: getSize(
                                              10,
                                            ),
                                            minHeight: getSize(
                                              50,
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
                                              11.00,
                                            ),
                                            bottom: getVerticalSize(
                                              11.00,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: ColorConstant.gray500,
                                          fontSize: getFontSize(
                                            15.0,
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
                                20.00,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25.00,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: ColorConstant.bluegray100,
                                      width: getHorizontalSize(
                                        1.00,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            16.00,
                                          ),
                                          top: getVerticalSize(
                                            15.00,
                                          ),
                                          bottom: getVerticalSize(
                                            15.00,
                                          ),
                                        ),
                                        child: Text(
                                          "Discount Type",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular149
                                              .copyWith(
                                            fontSize: getFontSize(
                                              15,
                                            ),
                                            height: 1.14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            38.64,
                                          ),
                                          top: getVerticalSize(
                                            14.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.49,
                                          ),
                                          bottom: getVerticalSize(
                                            13.53,
                                          ),
                                        ),
                                        child: Container(
                                          height: getVerticalSize(
                                            8.47,
                                          ),
                                          width: getHorizontalSize(
                                            15.87,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgArrowDown,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  height: getVerticalSize(
                                    46.00,
                                  ),
                                  width: getHorizontalSize(
                                      (MediaQuery.of(context).size.width/2)-10,
                                  ),
                                  decoration: AppDecoration
                                      .textstylerobotoromanregular1410,
                                  child: Text(
                                    "Discount on sale price",
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstylerobotoromanregular1410
                                        .copyWith(
                                      fontSize: getFontSize(
                                        15,
                                      ),
                                      height: 1.14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              100.00,
                            ),
                            right: getHorizontalSize(
                              1.00,
                            ),
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
                                  MediaQuery.of(context).size.width/2,
                                ),
                                decoration:
                                    AppDecoration.textstylerobotoromanbold135,
                                child: Text(
                                  "Cancel",
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanbold135
                                      .copyWith(
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
                                  MediaQuery.of(context).size.width/2,
                                ),
                                decoration:
                                    AppDecoration.textstylerobotoromanbold13,
                                child: Text(
                                  "Save".tr,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanbold13
                                      .copyWith(
                                    fontSize: getFontSize(
                                      15,
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
            ),
          ],
        ),
      ),
    ));
  }
}
