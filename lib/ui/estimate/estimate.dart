import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/estimate/addestimate/add_estimate_page.dart';
import 'package:thikdr/ui/estimate/widgets/estimate_item_widget.dart';
import 'package:thikdr/ui/invoice/main.dart';

import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';
import '../invoice/file_handle_api.dart';
import '../invoice/pdf_invoice_api.dart';
import 'models/estimate_details_model.dart';

class EstimatePage extends StatefulWidget {
  @override
  State<EstimatePage> createState() => _EstimateState();
}

class _EstimateState extends State<EstimatePage> {
  Rx<EstimateDetailsModel> estimateDetailsModelObj = EstimateDetailsModel().obs;
  TextEditingController searchController = TextEditingController();
  List<String> quotationList = [
    "",
    "",
    "",
    "",
  ];
  String dropdownvalue = 'Open Est';
  var items = [
    'Open Est',
    'Open Est 2',
    'Open Est3',
    'Open Est4',
    'Open Est5',
  ];

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
          //"Estimate Details".toUpperCase(),
          "Quotation List".toUpperCase(),
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
      /* bottomSheet:  Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEstimatePage()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorConstant.amberA701,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.lime90075,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          23.00,
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
                        child: SizedBox(
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
                          23.00,
                        ),
                        bottom: getVerticalSize(
                          12.00,
                        ),
                      ),
                      child: Text(
                        "Add Estimate".toUpperCase(),
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
          ),*/
      body: Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: getVerticalSize(
                        50.00,
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Enter name",
                          hintStyle:
                              AppStyle.textstylerobotoromanregular147.copyWith(
                            fontSize: getFontSize(
                              16.0,
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
                                10.00,
                              ),
                            ),
                            child: Container(
                              height: getSize(
                                22.00,
                              ),
                              width: getSize(
                                22.00,
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
                              16.00,
                            ),
                            top: getVerticalSize(
                              10.00,
                            ),
                            bottom: getVerticalSize(
                              10.00,
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: 7),
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: getVerticalSize(
                          50.00,
                        ),
                        margin: EdgeInsets.only(left: 5, top: 10, right: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: dropdownvalue,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:
                                    Text(items, style: TextStyle(fontSize: 13)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.35,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: quotationList.length,
                      itemBuilder: (context, index) {
                        return EstimateItemWidget(index, showCustomDialog);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEstimatePage()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 14, bottom: 10),
                  height: 50,
                  width: (MediaQuery.of(context).size.width),
                  decoration: AppDecoration.textstylerobotoromanbold13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            23.00,
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
                          child: SizedBox(
                            height: 9,
                            width: 9,
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
                            23.00,
                          ),
                          bottom: getVerticalSize(
                            12.00,
                          ),
                        ),
                        child: Text(
                          "Add Estimate".toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold131.copyWith(
                            fontSize: 15,
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

  // WEB Intent
  makePayment() {
    //Replace with actual values
    String orderId = "ORDER_ID";
    String stage = "TEST";
    //String orderAmount = "ORDER_AMOUNT";
    String orderAmount = "10";
    String tokenData = "18441588eef862d4129daf90314481";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "18441588eef862d4129daf90314481";
    String customerPhone = "9089876789";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
              if (key == "txStatus") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEstimatePage()));
              }
            }));
  }

  showCustomDialog(int index) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.width / 2.4,
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Invoice!',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                  // SizedBox(height: 50,),
                  Text(
                    'Would you like to convert invoice',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 12),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: InkWell(
                              child: Text(
                                'With GST',
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () => {
                                    createInvoice(),
                                    /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePageInvoice()),
                                )*/
                                  }),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: InkWell(
                              child: Text(
                                'With Out GST',
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () => {
                                    createInvoice(),
                                    /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePageInvoice()),
                                )*/
                                  }),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]),
                ],
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  createInvoice() async {
    final pdfFile = await PdfInvoiceApi.generate();

    // opening the pdf file
    FileHandleApi.openFile(pdfFile);
  }
}
