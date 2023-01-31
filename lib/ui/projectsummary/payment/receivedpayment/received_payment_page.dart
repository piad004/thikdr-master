
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import '../addparty/add_party_page.dart';

class ReceivedPaymentPage extends StatefulWidget {
  @override
  State<ReceivedPaymentPage> createState() => _ReceivedPaymentState();
}

class _ReceivedPaymentState extends State<ReceivedPaymentPage> {

  TextEditingController amountReceivedController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  var lightOrangeDecoration =BoxDecoration(
    color: ColorConstant.deepOrange400,
    borderRadius: BorderRadius.circular(
      getHorizontalSize(
        25.00,
      ),
    ),
  );
  var deepOrangeDecoration = AppDecoration.textstylerobotoromanbold147;
  var isOnline=1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        appBar:
        AppBar(
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
            "RECEIVED",
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
        backgroundColor: ColorConstant.gray51,

        bottomSheet:
        Container(
          height: 60,
          child:
          Center(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              margin: EdgeInsets.all(10),
              decoration:
              AppDecoration.textstylerobotoromanbold13,
              child: Text(
                "Save",
                textAlign: TextAlign.center,
                style:
                AppStyle.textstylerobotoromanbold13.copyWith(
                  fontSize: getFontSize(
                    15,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top:getVerticalSize(20)),
          decoration: BoxDecoration(
            color: ColorConstant.gray51,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // padding: MediaQuery.of(context).viewInsets,
                decoration: BoxDecoration(
                  color: ColorConstant.gray102,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getVerticalSize(
                        50.00,
                      ),
                      margin: EdgeInsets.only(
                          top: getVerticalSize(6),
                          bottom: getVerticalSize(6),
                          left: getHorizontalSize(20),
                          right: getHorizontalSize(20)),
                      child: TextFormField(
                        controller: amountReceivedController,
                        decoration: InputDecoration(
                          hintText: "Amount Received*",
                          hintStyle:
                          AppStyle.textstylerobotoromanbold162.copyWith(
                            fontSize: getFontSize(
                              16.0,
                            ),
                            color: ColorConstant.gray501,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
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
                                5.00,
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
                              11.00,
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
                          color: ColorConstant.gray501,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        50.00,
                      ),
                      margin: EdgeInsets.only(
                          top: getVerticalSize(6),
                          bottom: getVerticalSize(6),
                          left: getHorizontalSize(20),
                          right: getHorizontalSize(20)),
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle:
                          AppStyle.textstylerobotoromanbold162.copyWith(
                            fontSize: getFontSize(
                              16.0,
                            ),
                            color: ColorConstant.gray501,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
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
                                5.00,
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
                              11.00,
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
                          color: ColorConstant.gray501,
                          fontSize: getFontSize(
                            16.0,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    17.00,
                                  ),
                                  top: getVerticalSize(
                                    5.00,
                                  ),
                                  bottom: getVerticalSize(
                                    4.00,
                                  ),
                                ),
                                child: Container(
                                  height: getSize(
                                    28.00,
                                  ),
                                  width: getSize(
                                    28.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgCalendar,
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
                                    11.00,
                                  ),
                                  right: getHorizontalSize(
                                    19.00,
                                  ),
                                  bottom: getVerticalSize(
                                    10.00,
                                  ),
                                ),
                                child: Text(
                                  "DD/MM/YYYY",
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
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorConstant.deepOrange400,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                25.00,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: ()=>{
                                  setState((){
                                    isOnline=1;
                                  })
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 27,
                                  width: 60,
                                  decoration:(isOnline==1)?deepOrangeDecoration:lightOrangeDecoration,
                                  child: Text(
                                    "Online",
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold147
                                        .copyWith(
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      height: 1.14,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: ()=>{
                                  setState((){
                                    isOnline=0;
                                  })
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      15.00,
                                    ),
                                    top: getVerticalSize(
                                      11.00,
                                    ),
                                    right: getHorizontalSize(
                                      28.00,
                                    ),
                                    bottom: getVerticalSize(
                                      10.00,
                                    ),
                                  ),
                                  decoration: (isOnline==0)?deepOrangeDecoration:lightOrangeDecoration,
                                  child: Text(
                                    "Cash",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold141
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
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPartyPage()));
                        },
                        child:
                      Container(
                        margin: EdgeInsets.only(top: getVerticalSize(10),bottom: getVerticalSize(10),
                            left: getHorizontalSize(20),right: getHorizontalSize(20)),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  17.00,
                                ),
                                top: getVerticalSize(
                                  8.00,
                                ),
                                bottom: getVerticalSize(
                                  8.00,
                                ),
                              ),
                              child: Container(
                                height: getSize(
                                  28.00,
                                ),
                                width: getSize(
                                  28.00,
                                ),
                                child: Image.asset(
                                  ImageConstant.imgUser,
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
                                  14.00,
                                ),
                                right: getHorizontalSize(
                                  219.00,
                                ),
                                bottom: getVerticalSize(
                                  14.00,
                                ),
                              ),
                              child: Text(
                                "Party Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanbold16
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
                      ),),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: size.width/2-25,
                              margin: EdgeInsets.only(left: 10,
                                  bottom: getVerticalSize(10)),
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
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        17.00,
                                      ),
                                      top: getVerticalSize(
                                        8.00,
                                      ),
                                      bottom: getVerticalSize(
                                        8.00,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: getSize(
                                            28.00,
                                          ),
                                          width: getSize(
                                            28.00,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgBag,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              11.00,
                                            ),
                                            top: getVerticalSize(
                                              6.00,
                                            ),
                                            bottom: getVerticalSize(
                                              6.00,
                                            ),
                                          ),
                                          child: Text(
                                            "Category",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanbold16
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
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        20.00,
                                      ),
                                      right: getHorizontalSize(
                                        22.00,
                                      ),
                                      bottom: getVerticalSize(
                                        19.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        5.00,
                                      ),
                                      width: getHorizontalSize(
                                        10.00,
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
                              width: size.width/2-25,
                              margin: EdgeInsets.only(left: getHorizontalSize(5),right: getHorizontalSize(20),
                                  bottom: getVerticalSize(10)),
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
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        17.00,
                                      ),
                                      top: getVerticalSize(
                                        8.00,
                                      ),
                                      bottom: getVerticalSize(
                                        8.00,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: getSize(
                                            28.00,
                                          ),
                                          width: getSize(
                                            28.00,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgTrade,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              11.00,
                                            ),
                                            top: getVerticalSize(
                                              6.00,
                                            ),
                                            bottom: getVerticalSize(
                                              6.00,
                                            ),
                                          ),
                                          child: Text(
                                            "Trade",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanbold16
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
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        20.00,
                                      ),
                                      right: getHorizontalSize(
                                        22.00,
                                      ),
                                      bottom: getVerticalSize(
                                        19.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        5.00,
                                      ),
                                      width: getHorizontalSize(
                                        10.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgArrowDown,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

