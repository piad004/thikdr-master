import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thikdr/ui/estimate/addestimate/model/item_model.dart';
import 'package:thikdr/utils/progress_dialog_utils.dart';

import '../../../network/webservice.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/pref_utils.dart';

class AddItemEstimatePage extends StatefulWidget {
  final String name;
  final String itemType;
  final String salePrice;
  final String purchasePrice;
  final int qty;
  final String hsn;
  final String unit;
  final String gst;
  final String total;

  AddItemEstimatePage({
    Key? key,
    this.name = "",
    this.itemType = "",
    this.salePrice = "",
    this.purchasePrice = "",
    this.qty = 0,
    this.hsn = "",
    this.unit = "BOX",
    this.gst = "",
    this.total = "",
  }) : super(key: key);

  @override
  State<AddItemEstimatePage> createState() => _AddItemEstimateState();
}

class _AddItemEstimateState extends State<AddItemEstimatePage> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController salesPriceUnitController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController hsnController = TextEditingController();

  var taxPercent = "None";
  var tax = "0.0";
  var subTotal = "0.0";
  var totalAmt = "0.0";
  String unit = "BOX";
  final items = [
    'BOX',
    'PCS',
  ];
  var itemTypeBackgroundColor = ColorConstant.gray200;
  var itemType = "";
  var notValidQtyPrice = "Please fill quantity and sales price!";
  String name = "Item Name";

  @override
  void initState() {
    super.initState();
    setState(() {
      if(widget.name!='') {
        itemNameController.text = widget.name;
        unit = widget.unit;
        quantityController.text = widget.qty.toString().trim();
        salesPriceUnitController.text = widget.salePrice;
        purchasePriceController.text = widget.purchasePrice;
        hsnController.text = widget.hsn;
        itemType = widget.itemType;

        taxPercent = widget.gst + "%";
        subTotal = (double.parse(
            quantityController.text.toString()) *
            double.parse(salesPriceUnitController.text))
            .toStringAsFixed(2);
        tax = ((double.parse(subTotal) * double.parse(taxPercent)) / 100)
            .toStringAsFixed(2);
        totalAmt = (double.parse(subTotal) + double.parse(tax))
            .toStringAsFixed(2);

        totalAmt =
            (double.parse(subTotal) + double.parse(tax))
                .toStringAsFixed(2);
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    quantityController.dispose();
    salesPriceUnitController.dispose();
    super.dispose();
  }

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
            "Add Items To Estimate/Quotation".toUpperCase(),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.textstylerobotobold20.copyWith(
              fontSize: 15,
              height: 1,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: ColorConstant.whiteA700,
        bottomSheet: Padding(
          padding: EdgeInsets.only(
            bottom: getVerticalSize(
              10.00,
            ),
            left: getHorizontalSize(10),
            right: getHorizontalSize(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 30.0,
                padding: EdgeInsets.symmetric(horizontal: 11.0),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstant.red300),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (int.parse(quantityController.text) > 0) {
                          setState(() {
                            quantityController.text =
                                (int.parse(quantityController.text) - 1)
                                    .toString();
                            if (salesPriceUnitController.text
                                .toString()
                                .isNotEmpty) {
                              subTotal = (double.parse(
                                          quantityController.text.toString()) *
                                      int.parse(salesPriceUnitController.text))
                                  .toString();
                              totalAmt =
                                  (double.parse(subTotal) + double.parse(tax))
                                      .toString();
                            }
                          });
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        color: ColorConstant.red300,
                        size: 20.0,
                        //size: 23.3,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: 40,
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 3,
                        onChanged: (text) {
                          if (text.toString().isNotEmpty &&
                              salesPriceUnitController.text
                                  .toString()
                                  .isNotEmpty) {
                            setState(() {
                              subTotal = (double.parse(text.toString()) *
                                      int.parse(salesPriceUnitController.text))
                                  .toString();
                              totalAmt =
                                  (double.parse(subTotal) + double.parse(tax))
                                      .toString();
                            });
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "QTY",
                          hintStyle:
                              AppStyle.textstylerobotoromanregular16.copyWith(
                            fontSize: 12,
                            color: ColorConstant.gray400,
                          ),
                          counterText: "",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            backgroundColor: Colors.white),
                      ),
                    ),
                    /* Text(
                       "12",
                        style: Theme.of(context)
                            .textTheme
                            .caption),*/
                    SizedBox(width: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          setState(() {
                            if (quantityController.text.trim().length == 0)
                              quantityController.text = "0";
                            quantityController.text =
                                (int.parse(quantityController.text) + 1)
                                    .toString();
                            if (salesPriceUnitController.text
                                .toString()
                                .isNotEmpty) {
                              subTotal = (double.parse(
                                          quantityController.text.toString()) *
                                      int.parse(salesPriceUnitController.text))
                                  .toString();
                              totalAmt =
                                  (double.parse(subTotal) + double.parse(tax))
                                      .toString();
                            }
                          });
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: ColorConstant.red300,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  addEstimateItem();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: AppDecoration.textstylerobotoromanbold13,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           ItemsWidget(name:
                      //           "Earphone",
                      //             hsn: "abcde",
                      //             qty: 10,
                      //             salePrice: "400",
                      //             unit: "Unit 3",
                      //             total: "26",
                      //             purchasePrice: "10", names: '',)
                      //   ),)
                      ;
                    },
                    child: InkWell(
                      onTap: () => Navigator.pop(context, 'return value :)'),
                      child: Text(
                        "Save",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold13.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Container(
                              height: getSize(
                                20.00,
                              ),
                              width: getSize(
                                20.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgBack,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                7.00,
                              ),
                              top: getVerticalSize(
                                4.00,
                              ),
                              bottom: getVerticalSize(
                                4.00,
                              ),
                            ),
                            child: Text(
                              "msg_items_to_estima".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                              AppStyle.textstylerobotobold19.copyWith(
                                fontSize: getFontSize(
                                  19,
                                ),
                                height: 0.84,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                15.00,
                              ),
                              top: getVerticalSize(
                                2.00,
                              ),
                              bottom: getVerticalSize(
                                2.00,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                20.00,
                              ),
                              width: getHorizontalSize(
                                16.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgPdf,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                7.00,
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
                                ImageConstant.imgPlus,
                                fit: BoxFit.fill,
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
                    top:10,
                    bottom: 50,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
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
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray101,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    top: 10,
                                    right: 5,
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      controller: itemNameController,
                                      decoration: InputDecoration(
                                        hintText: name,
                                        hintStyle: AppStyle
                                            .textstylerobotoromanregular16
                                            .copyWith(
                                          fontSize: 15,
                                          color: ColorConstant.gray500,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorConstant.bluegray100,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
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
                                          left: 16,
                                          top: 12,
                                          bottom: 12,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, left: 10, bottom: 5),
                                  child: Text(
                                    "Item Type",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstylerobotoromanregular128
                                        .copyWith(
                                      fontSize: 14,
                                      color: ColorConstant.black900,
                                      height: 1.42,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () => {
                                          setState(() {
                                            itemType = "Product";
                                          })
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: 20,
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, bottom: 4),
                                          decoration: BoxDecoration(
                                            color: (itemType == "Product")
                                                ? ColorConstant.red300
                                                : ColorConstant.gray200,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: ColorConstant.bluegray100,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            "Product",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanregular128
                                                .copyWith(
                                              fontSize: 14,
                                              color: (itemType == "Product")
                                                  ? ColorConstant.whiteA700
                                                  : ColorConstant.black900,
                                              height: 1.42,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => {
                                          setState(() {
                                            itemType = "Service";
                                          })
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: 20,
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, bottom: 4),
                                          decoration: BoxDecoration(
                                            color: (itemType == "Service")
                                                ? ColorConstant.red300
                                                : ColorConstant.gray200,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: ColorConstant.bluegray100,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            "Service",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanregular128
                                                .copyWith(
                                              fontSize: 14,
                                              color: (itemType == "Service")
                                                  ? ColorConstant.whiteA700
                                                  : ColorConstant.black900,
                                              height: 1.42,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      /*Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width-220,
                                        margin: EdgeInsets.only(left: 5,top: 10),
                                        child: TextFormField(
                                          controller: quantityController,
                                          onChanged: (text) {
                                            if(text.toString().isNotEmpty && ratePriceUnitController.text.toString().isNotEmpty){
                                              setState(() {

                                                subTotal =
                                                    (double.parse(text.toString())*int.parse(ratePriceUnitController.text)).toString();
totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                              });
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Quantity",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
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
                                                10.00,
                                              ),
                                              bottom: getVerticalSize(
                                                10.00,
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
                                      ),*/
                                      Container(
                                        height: 50,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                30,
                                        margin:
                                            EdgeInsets.only(left: 5, top: 10),
                                        child: TextFormField(
                                          controller: hsnController,
                                          /*  onChanged: (text) {
                                            if(text.toString().isNotEmpty && ratePriceUnitController.text.toString().isNotEmpty){
                                              setState(() {
                                                subTotal =
                                                    (double.parse(text.toString())*int.parse(ratePriceUnitController.text)).toString();
                                                totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                              });
                                            }
                                          },*/
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "HSN",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: 15,
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
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
                                                10,
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
                                              left: 16,
                                              top: 12,
                                              bottom: 12,
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                20,
                                        margin: EdgeInsets.only(
                                          right: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                            10,
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
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 40,
                                              width:
                                              (MediaQuery.of(context).size.width /
                                                  2.3) ,
                                              padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 5,
                                                bottom: 10,
                                              ),

                                              child:
                                              DropdownButton(
                                                value: unit,
                                                icon: const Icon(Icons.keyboard_arrow_down),
                                                items: items.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items,style: TextStyle(fontSize: 13),),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    unit = newValue!;
                                                  });
                                                },
                                                underline: Text(''),
                                                isExpanded: true,
                                              ),
                                              //     DropdownButtonHideUnderline(
                                              //   child: DropdownButton2(
                                              //     isExpanded: true,
                                              //     hint: Row(
                                              //       children: const [
                                              //         Icon(
                                              //           Icons.list,
                                              //           size: 0,
                                              //           color: Colors.yellow,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 4,
                                              //         ),
                                              //         Expanded(
                                              //           child: Text(
                                              //             'Select Item',
                                              //             style: TextStyle(
                                              //               fontSize: 14,
                                              //               fontWeight:
                                              //                   FontWeight
                                              //                       .normal,
                                              //               color: Colors.black,
                                              //             ),
                                              //             overflow: TextOverflow
                                              //                 .ellipsis,
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //
                                              //     // items: items
                                              //     //     .map((item) =>
                                              //     //         DropdownMenuItem<
                                              //     //             String>(
                                              //     //           value: item,
                                              //     //           child: Text(
                                              //     //             item,
                                              //     //             style:
                                              //     //                 const TextStyle(
                                              //     //               fontSize: 14,
                                              //     //               fontWeight:
                                              //     //                   FontWeight
                                              //     //                       .normal,
                                              //     //               color: Colors
                                              //     //                   .black,
                                              //     //             ),
                                              //     //             overflow:
                                              //     //                 TextOverflow
                                              //     //                     .ellipsis,
                                              //     //           ),
                                              //     //         ))
                                              //     //     .toList(),
                                              //     // value: unit.isEmpty?null:unit,
                                              //     // onChanged: (value) {
                                              //     //   setState(() {
                                              //     //     unit = value as String;
                                              //     //   });
                                              //     // },
                                              //     icon: const Icon(
                                              //       Icons
                                              //           .arrow_forward_ios_outlined,
                                              //     ),
                                              //     iconSize: 0,
                                              //     iconEnabledColor:
                                              //         Colors.yellow,
                                              //     iconDisabledColor:
                                              //         Colors.grey,
                                              //     buttonHeight: 50,
                                              //     buttonWidth: 70,
                                              //     buttonPadding:
                                              //         const EdgeInsets.only(
                                              //             left: 14, right: 14),
                                              //     /* buttonDecoration: BoxDecoration(
                                              //       borderRadius: BorderRadius.circular(14),
                                              //       border: Border.all(
                                              //         color: Colors.black26,
                                              //       ),
                                              //       color: Colors.redAccent,
                                              //     ),*/
                                              //     buttonElevation: 2,
                                              //     itemHeight: 40,
                                              //     itemPadding:
                                              //         const EdgeInsets.only(
                                              //             left: 14, right: 1),
                                              //     dropdownMaxHeight: 200,
                                              //     dropdownWidth: 200,
                                              //     dropdownPadding: null,
                                              //     dropdownDecoration:
                                              //         BoxDecoration(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               14),
                                              //       color: Colors.white,
                                              //     ),
                                              //     dropdownElevation: 8,
                                              //     scrollbarRadius:
                                              //         const Radius.circular(40),
                                              //     scrollbarThickness: 6,
                                              //     scrollbarAlwaysShow: true,
                                              //     offset: const Offset(-20, 0),
                                              //   ),
                                              // ),
                                              /*Text(
                                                unit,
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
                                              ),*/
                                            ),
                                           /* Padding(
                                              padding: EdgeInsets.only(
                                                left: 10,
                                                top: 14,
                                                right: 12,
                                                bottom: 14,
                                              ),
                                              child: Container(
                                                height: 9,
                                                width: 16,
                                                child: SvgPicture.asset(
                                                  ImageConstant.imgArrowDown,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),*/
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      /*Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width-220,
                                        margin: EdgeInsets.only(left: 5,top: 10),
                                        child: TextFormField(
                                          controller: quantityController,
                                          onChanged: (text) {
                                            if(text.toString().isNotEmpty && ratePriceUnitController.text.toString().isNotEmpty){
                                              setState(() {

                                                subTotal =
                                                    (double.parse(text.toString())*int.parse(ratePriceUnitController.text)).toString();
totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                              });
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Quantity",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
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
                                                10.00,
                                              ),
                                              bottom: getVerticalSize(
                                                10.00,
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
                                      ),*/
                                      Container(
                                        height: 50,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                30,
                                        margin:
                                            EdgeInsets.only(left: 5, top: 10),
                                        child: TextFormField(
                                          controller: salesPriceUnitController,
                                          /*  onChanged: (text) {
                                            if(text.toString().isNotEmpty && ratePriceUnitController.text.toString().isNotEmpty){
                                              setState(() {
                                                subTotal =
                                                    (double.parse(text.toString())*int.parse(ratePriceUnitController.text)).toString();
                                                totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                              });
                                            }
                                          },*/
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Sales Price",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: 15,
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
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
                                                10,
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
                                              left: 16,
                                              top: 12,
                                              bottom: 12,
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                20,
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, top: 10),
                                        child: TextFormField(
                                          controller: purchasePriceController,
                                          /*  onChanged: (text) {
                                            if(text.toString().isNotEmpty && ratePriceUnitController.text.toString().isNotEmpty){
                                              setState(() {
                                                subTotal =
                                                    (double.parse(text.toString())*int.parse(ratePriceUnitController.text)).toString();
                                                totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                              });
                                            }
                                          },*/
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Purchase Price",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: 15,
                                              color: ColorConstant.gray500,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
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
                                                10,
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
                                              left: 16,
                                              top: 12,
                                              bottom: 12,
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //////

                                /*Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    top: getVerticalSize(
                                      10.00,
                                    ),
                                    right: 5,
                                    bottom: getVerticalSize(
                                      15.00,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      36.00,
                                    ),
                                    width: getHorizontalSize(
                                      MediaQuery.of(context).size.width,
                                    ),
                                    child: TextFormField(
                                      controller: hsnController,
                                      onChanged: (text) {
                                       */ /* if(text.toString().isNotEmpty && quantityController.text.toString().isNotEmpty){
                                          setState(() {

                                            subTotal =
                                                (double.parse(text.toString())*int.parse(quantityController.text)).toString();
                                            totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                                          });
                                        }*/ /*
                                      },
                                      decoration: InputDecoration(
                                        hintText: "HSN",
                                        hintStyle: AppStyle
                                            .textstylerobotoromanregular16
                                            .copyWith(
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
                                            10.00,
                                          ),
                                          bottom: getVerticalSize(
                                            10.00,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
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
                                ),*/
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: getVerticalSize(
                                28.00,
                              ),
                              right: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      11.00,
                                    ),
                                    top: getVerticalSize(
                                      14.00,
                                    ),
                                    right: getHorizontalSize(
                                      11.00,
                                    ),
                                  ),
                                  child: Text(
                                    "Total & Taxes",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold122
                                        .copyWith(
                                      fontSize: 13,
                                      height: 0.83,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    2.00,
                                  ),
                                  width: getHorizontalSize(
                                    double.infinity,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      11.00,
                                    ),
                                    top: getVerticalSize(
                                      7.00,
                                    ),
                                    right: getHorizontalSize(
                                      11.00,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray301,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        11.00,
                                      ),
                                      top: getVerticalSize(
                                        13.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Subtotal (Sales Price x Qty)",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular128
                                              .copyWith(
                                            fontSize: 12,
                                            height: 1.42,
                                          ),
                                        ),
                                        Text(
                                          "₹ " + subTotal,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular128
                                              .copyWith(
                                            fontSize: 12,
                                            height: 1.42,
                                            color: ColorConstant.black900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        11.00,
                                      ),
                                      top: getVerticalSize(
                                        11.00,
                                      ),
                                      right: getHorizontalSize(
                                        9.00,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: getVerticalSize(
                                              3.00,
                                            ),
                                            bottom: getVerticalSize(
                                              6.00,
                                            ),
                                          ),
                                          child: Text(
                                            "GST Tax %",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanregular128
                                                .copyWith(
                                              fontSize: 12,
                                              height: 1.42,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                openBottomSheet();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    getHorizontalSize(
                                                      25.00,
                                                    ),
                                                  ),
                                                  border: Border.all(
                                                    color: ColorConstant
                                                        .bluegray100,
                                                    width: getHorizontalSize(
                                                      1.00,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                          7.00,
                                                        ),
                                                        top: getVerticalSize(
                                                          5.00,
                                                        ),
                                                        bottom: getVerticalSize(
                                                          5.00,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        taxPercent,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstylerobotoromanregular1210
                                                            .copyWith(
                                                          fontSize: 12,
                                                          height: 1.33,
                                                          color: ColorConstant
                                                              .black900,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                        top: 10,
                                                        right: 7,
                                                        bottom: 10,
                                                      ),
                                                      child: Container(
                                                        height: 5,
                                                        width: 7,
                                                        child: SvgPicture.asset(
                                                          ImageConstant
                                                              .imgArrowDown,
                                                          fit: BoxFit.fill,
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
                                                  10.00,
                                                ),
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: getVerticalSize(
                                                  26.00,
                                                ),
                                                decoration: AppDecoration
                                                    .textstylerobotoromanregular1211,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                    right: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "₹ " + tax,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstylerobotoromanregular1211
                                                        .copyWith(
                                                      fontSize: 12,
                                                      height: 1.42,
                                                      color: ColorConstant
                                                          .black900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        11.00,
                                      ),
                                      top: getVerticalSize(
                                        21.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        13.00,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Total Amount",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular123
                                              .copyWith(
                                            fontSize: 12,
                                            height: 1.42,
                                          ),
                                        ),
                                        Text(
                                          "₹ " + totalAmt,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstylerobotoromanregular123
                                              .copyWith(
                                            fontSize: 12,
                                            height: 1.42,
                                            color: ColorConstant.black900,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        });
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    20.00,
                  ),
                  top: getVerticalSize(
                    21.00,
                  ),
                  right: getHorizontalSize(
                    20.00,
                  ),
                  bottom: getVerticalSize(
                    13.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Tax %",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanregular123.copyWith(
                        fontSize: getFontSize(
                          16,
                        ),
                        fontWeight: FontWeight.bold,
                        height: 1.40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: getVerticalSize(
                          10,
                        ),
                        width: getHorizontalSize(
                          15,
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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if (double.parse(subTotal) > 0) {
                    setState(() {
                      taxPercent = "None-0.0%";
                      tax = ((double.parse(subTotal) * 0.0) / 100).toString();
                      totalAmt = (double.parse(subTotal) + double.parse(tax))
                          .toStringAsFixed(2);
                    });
                  } else
                    showMsg(notValidQtyPrice);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      8.00,
                    ),
                    right: getHorizontalSize(
                      50.00,
                    ),
                    bottom: getVerticalSize(
                      8.00,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "None",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                      Text(
                        "0.0 %",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if (double.parse(subTotal) > 0) {
                    setState(() {
                      taxPercent = "Exempted-0.0%";
                      tax = ((double.parse(subTotal) * 0.0) / 100).toString();
                      totalAmt = (double.parse(subTotal) + double.parse(tax))
                          .toStringAsFixed(2);
                    });
                  } else
                    showMsg(notValidQtyPrice);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      8.00,
                    ),
                    right: getHorizontalSize(
                      50.00,
                    ),
                    bottom: getVerticalSize(
                      8.00,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Exempted",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                      Text(
                        "0.0 %",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if (double.parse(subTotal) > 0) {
                    setState(() {
                      taxPercent = "Gst@0%-0.0%";
                      tax = ((double.parse(subTotal) * 0.0) / 100).toString();
                      totalAmt = (double.parse(subTotal) + double.parse(tax))
                          .toStringAsFixed(2);
                    });
                  } else
                    showMsg(notValidQtyPrice);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      8.00,
                    ),
                    right: getHorizontalSize(
                      50.00,
                    ),
                    bottom: getVerticalSize(
                      8.00,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Gst@0%",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                      Text(
                        "0.0 %",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if (double.parse(subTotal) > 0) {
                    setState(() {
                      taxPercent = "Gst@0.25%-0.25%";
                      tax = ((double.parse(subTotal) * 0.25) / 100).toString();
                      totalAmt = (double.parse(subTotal) + double.parse(tax))
                          .toStringAsFixed(2);
                    });
                  } else
                    showMsg(notValidQtyPrice);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    top: getVerticalSize(
                      8.00,
                    ),
                    right: getHorizontalSize(
                      50.00,
                    ),
                    bottom: getVerticalSize(
                      40.00,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Gst@0.25%",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                      Text(
                        "0.25 %",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular123.copyWith(
                          fontSize: getFontSize(
                            16,
                          ),
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /* ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),*/
            ],
          );
        });
  }

  void addEstimateItem() async {
    if (itemNameController.text.toString().isEmpty) {
      showMsg("Item name empty!");
    } else if (itemType.isEmpty) {
      showMsg("Select item type!");
    } else if (salesPriceUnitController.text.toString().isEmpty) {
      showMsg("Sales price empty!");
    } else if (purchasePriceController.text.toString().isEmpty) {
      showMsg("Purchase price empty!");
    } else if (quantityController.text.toString().isEmpty) {
      showMsg("Quantity empty!");
    } else if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    } else {
      getRequestAddEstimateItem();
    }
  }

  Future<void> getRequestAddEstimateItem() async {
    try {
      ProgressDialogUtils().progressDialogue(context);
      var token = await PrefUtils().getPreferencesData("token");

      var leadModel = await Webservice().requestEstimateItemAdd(
          token.toString(),
          itemNameController.text.toString(),
          quantityController.text.toString(),
          salesPriceUnitController.text.toString(),
          unit,
          subTotal,
          tax,
          totalAmt);
      ProgressDialogUtils().hideProgressDialog(context, mounted);

      if (!leadModel.error) {
        /*Navigator.push(context,
            MaterialPageRoute(builder: (context) => EstimateQuotationPage()));*/
        Navigator.of(context).pop({
          'itemName': itemNameController.text.toString(),
          'itemType': itemType,
          'quantity': quantityController.text.toString(),
          'unit': unit,
          'ratePrice': salesPriceUnitController.text.toString(),
          'hsn': hsnController.text.toString(),
          'gst': tax,
          'total': totalAmt
        });
      }
      showMsg(leadModel.message);

      print('buy leads response : ${jsonEncode(leadModel)}');
    } catch (e) {
      ProgressDialogUtils().hideProgressDialog(context, mounted);
      showMsg(e.toString());
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
