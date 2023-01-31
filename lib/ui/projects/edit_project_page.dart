import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';
import '../projectsummary/payment/addparty/add_party_page.dart';

class EditProjectPage extends StatefulWidget {
  @override
  State<EditProjectPage> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProjectPage>
    with TickerProviderStateMixin {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerMobileController = TextEditingController();

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
          "ADD/EDIT PROJECT",
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
      bottomSheet: InkWell(
        onTap: () {
          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddUsedMaterialPage()));*/
        },
        child: Container(
          margin: EdgeInsets.only(
              bottom: getVerticalSize(
                10.00,
              ),
              left: 5,
              right: 10),
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
                    3.00,
                  ),
                  top: getVerticalSize(
                    16.00,
                  ),
                  right: getHorizontalSize(
                    10.00,
                  ),
                  bottom: getVerticalSize(
                    14.00,
                  ),
                ),
                child: Text(
                  "SAVE",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanbold131.copyWith(
                    fontSize: getFontSize(
                      16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: getVerticalSize(
                    20.00,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getSize(
                        200.00,
                      ),
                      width: size.width,
                      child: Image.asset(
                        ImageConstant.imgHomeConstruction,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: getVerticalSize(
                            30.00,
                          ),
                          bottom: getVerticalSize(
                            30.00,
                          ),
                        ),
                        child: Text(
                          "Home Construction",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold167.copyWith(
                            fontSize: getFontSize(
                              20,
                            ),
                            height: 1.00,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        44.00,
                      ),
                      width: getHorizontalSize(
                        MediaQuery.of(context).size.width,
                      ),
                      child: TextFormField(
                        controller: projectNameController,
                        decoration: InputDecoration(
                          hintText: "Project Name",
                          hintStyle: AppStyle.textstyleregular16.copyWith(
                            fontSize: getFontSize(
                              16.0,
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

                          /* suffixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    12.00,
                                  ),
                                ),
                                child: Container(
                                  height: getSize(
                                    18.00,
                                  ),
                                  width: getSize(
                                    18.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgSearch,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),*/
                          suffixIconConstraints: BoxConstraints(
                            minWidth: getSize(
                              18.00,
                            ),
                            minHeight: getSize(
                              18.00,
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
                              15.00,
                            ),
                            bottom: getVerticalSize(
                              15.00,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray500,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      /* height: getVerticalSize(
                            44.00,
                          ),*/
                      width: getHorizontalSize(
                        MediaQuery.of(context).size.width,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: addressController,
                        maxLines: 2,
                        minLines: 2,
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: AppStyle.textstyleregular16.copyWith(
                            fontSize: getFontSize(
                              16.0,
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
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
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
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray500,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        MediaQuery.of(context).size.width,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: cityController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "City",
                          hintStyle: AppStyle.textstyleregular16.copyWith(
                            fontSize: getFontSize(
                              16.0,
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
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
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
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray500,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        MediaQuery.of(context).size.width,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        onTap: () { FocusScope.of(context).requestFocus(new FocusNode());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddPartyPage()));},
                        controller: customerNameController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Customer name",
                          hintStyle: AppStyle.textstyleregular16.copyWith(
                            fontSize: getFontSize(
                              16.0,
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
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
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
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray500,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        MediaQuery.of(context).size.width,
                      ),
                      margin: EdgeInsets.only(top: 10,bottom: 40),
                      child: TextFormField(
                        controller: customerMobileController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Customer mobile",
                          hintStyle: AppStyle.textstyleregular16.copyWith(
                            fontSize: getFontSize(
                              16.0,
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
                          filled: true,
                          fillColor: ColorConstant.whiteA700,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
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
                        ),
                        style: TextStyle(
                          color: ColorConstant.gray500,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
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
    ));
  }
}
