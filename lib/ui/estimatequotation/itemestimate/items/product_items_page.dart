import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/addproduct/add_product.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/items/itemdetails/item_details_page.dart';

import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';

class ProductItemsPage extends StatefulWidget {
  @override
  State<ProductItemsPage> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItemsPage> {
  TextEditingController searchItemsbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return
      SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
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
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          5.00,
                        ),
                        bottom: getVerticalSize(
                          5.00,
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
                          controller: searchItemsbyController,
                          decoration: InputDecoration(
                            hintText: "Search Items by Name or Code",
                            hintStyle: AppStyle.textstylerobotoromanregular147
                                .copyWith(
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
                                56.00,
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
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  31.00,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        10.00,
                      ),
                      top: getVerticalSize(
                        1.00,
                      ),
                      bottom: getVerticalSize(
                        7.00,
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Sand",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 0.57,
                            ),
                          ),
                          TextSpan(
                            text: "(1234)",
                            style: TextStyle(
                              color: ColorConstant.gray701,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.57,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getHorizontalSize(
                        21.00,
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
                        ImageConstant.imgShare,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemDetailsPage()));
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                11.00,
                              ),
                              top: getVerticalSize(
                                13.00,
                              ),
                              right: getHorizontalSize(
                                15.00,
                              ),
                            ),
                            child: Text(
                              "Sale Price",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                fontSize: getFontSize(
                                  14,
                                ),
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                11.00,
                              ),
                              top: getVerticalSize(
                                13.00,
                              ),
                              right: getHorizontalSize(
                                15.00,
                              ),
                            ),
                            child: Text(
                              "Purchase Price",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                fontSize: getFontSize(
                                  14,
                                ),
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                11.00,
                              ),
                              top: getVerticalSize(
                                13.00,
                              ),
                              right: getHorizontalSize(
                                15.00,
                              ),
                            ),
                            child: Text(
                              "In Stock",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                fontSize: getFontSize(
                                  14,
                                ),
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                11.00,
                              ),
                              top: getVerticalSize(
                                9.00,
                              ),
                              right: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            child: Text(
                              "Rs. 00.00",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                1.00,
                              ),
                              top: getVerticalSize(
                                9.00,
                              ),
                              right: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            child: Text(
                              "Rs. 00.00",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                11.00,
                              ),
                              top: getVerticalSize(
                                9.00,
                              ),
                              right: getHorizontalSize(
                                15.00,
                              ),
                            ),
                            child: Text(
                              "Rs. 00.00",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.red500,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ]),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProductPage()));
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    95.00,
                  ),
                  top: getVerticalSize(
                    200.00,
                  ),
                  right: getHorizontalSize(
                    133.00,
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
                        "Add UNIT".toUpperCase(),
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
          ),
        ],
      ),
    );
  }
}
