import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../../add_item_estimate.dart';

class ItemsWidget extends StatefulWidget {
  var name = 'Add Party';

  ItemsWidget(this.name, {Key? key}) : super(key: key);

  // final String names;
  // final String salePrice;
  // final String purchasePrice;
  // final int qty;
  // final String hsn;
  // final String unit;
  // final String total;
  // ItemsWidget({
  //   Key? key,
  //   this.name = "",
  //   this.salePrice = "",
  //   this.purchasePrice = "",
  //   this.qty = 0
  //   this.hsn = "",
  //   this.unit = "Unit 1",
  //   this.total = "", required this.names,
  // });

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController salesPriceUnitController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController hsnController = TextEditingController();

  var taxPercent = "None";
  var tax = "0.0";
  var subTotal = "0.0";
  var totalAmt = "0.0";
  String unit = "Unit 1";
  var isAdd=true;

  List<String> itemsList = [
    'List 1',
    'List 2',
    'List 3',
    'List 4',
    'List 5',
  ];

  @override
  void initState() {
    super.initState();
    // itemNameController.text=widget.name;
    // unit=widget.unit;
    // quantityController.text=widget.unit;
    // salesPriceUnitController.text=widget.salePrice;
    // purchasePriceController.text=widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 10, top: 7, bottom: 7),
      padding: EdgeInsets.only(top: 5,bottom: 5),
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.lightBlue50,
                      boxShadow: [
                        BoxShadow(
                            color: ColorConstant.lightBlue50, spreadRadius: 3),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Sample item'),
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:10),
                                child: Text(
                                  '₹ 200/BOX',
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, -5))
                                    ],
                                    color: Colors.transparent,
                                    decoration:
                                    TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    decorationThickness: 1,
                                    decorationStyle:
                                    TextDecorationStyle.dashed,
                                  ),
                                ),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text('STOCK : '),
                            ),
                            Container(
                              child: Text('19BOX'),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('PP'),
                              ),
                              Container(
                                child: Text('MRP'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('₹100'),
                              ),
                              Container(
                                child: Text('₹110'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Visibility(
                    visible: isAdd?true:false,
                    child:
                    InkWell(
                      onTap: ()=>{
                        setState((){
                          isAdd=false;
                      })
                      },
                      child: Container(
                       margin: EdgeInsets.only(left: 10,right: 5,top: 5,bottom: 10),
                        padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.red300),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isAdd?false:true,
                    child: Container(
                      margin: EdgeInsets.only(left: 10,right: 5,top: 5,bottom: 10),
                      padding:
                      EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 5),
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstant.lightBlue50),
                        ],
                      ),
                    ),
                  ),

                  //////////////

                  Visibility(
                    visible:  isAdd?false:true,
                    child: Container(
                      height: 30.0,
                      margin: EdgeInsets.only(right: 5),
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
                                    subTotal = (double.parse(quantityController
                                                .text
                                                .toString()) *
                                            int.parse(
                                                salesPriceUnitController.text))
                                        .toString();
                                    totalAmt = (double.parse(subTotal) +
                                            double.parse(tax))
                                        .toString();
                                  }
                                });
                              }else{
                                  setState(() {
                                    isAdd = true;
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
                                            int.parse(
                                                salesPriceUnitController.text))
                                        .toString();
                                    totalAmt = (double.parse(subTotal) +
                                            double.parse(tax))
                                        .toString();
                                  });
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "QTY",
                                hintStyle: AppStyle.textstylerobotoromanregular16
                                    .copyWith(
                                  fontSize: 12,
                                  color: ColorConstant.black900,
                                ),
                                counterText: "",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              style: TextStyle(
                                  color: ColorConstant.gray500,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  backgroundColor: Colors.white),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  if (quantityController.text.length == 0)
                                    quantityController.text = "0";
                                  quantityController.text =
                                      (int.parse(quantityController.text) + 1)
                                          .toString();
                                  if (salesPriceUnitController.text
                                      .toString()
                                      .isNotEmpty) {
                                    subTotal = (double.parse(quantityController
                                                .text
                                                .toString()) *
                                            int.parse(
                                                salesPriceUnitController.text))
                                        .toString();
                                    totalAmt = (double.parse(subTotal) +
                                            double.parse(tax))
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
                  ),

                  ///////////////
                ],
              ),
            ],
          )
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.name,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                height: 0.57,
                              ),
                            ),
                            TextSpan(
                              text: "(1234)",
                              style: TextStyle(
                                color: ColorConstant.gray701,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.57,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 170,),
                      Column(
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddItemEstimatePage(
                                            name: "Earphone",
                                            hsn: "abcde",
                                            qty: 10,
                                            salePrice: "400",
                                            unit: "Unit 3",
                                            total: "26",
                                            purchasePrice: "10",
                                          )),
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 30.0,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 11.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.red300),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (int.parse(
                                                  quantityController.text) >
                                              0) {
                                            setState(() {
                                              quantityController
                                                  .text = (int.parse(
                                                          quantityController
                                                              .text) -
                                                      1)
                                                  .toString();
                                              if (salesPriceUnitController
                                                  .text
                                                  .toString()
                                                  .isNotEmpty) {
                                                subTotal = (double.parse(
                                                            quantityController
                                                                .text
                                                                .toString()) *
                                                        int.parse(
                                                            salesPriceUnitController
                                                                .text))
                                                    .toString();
                                                totalAmt =
                                                    (double.parse(subTotal) +
                                                            double.parse(tax))
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
                                          inputFormatters: <
                                              TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          maxLength: 3,
                                          onChanged: (text) {
                                            if (text.toString().isNotEmpty &&
                                                salesPriceUnitController.text
                                                    .toString()
                                                    .isNotEmpty) {
                                              setState(() {
                                                subTotal = (double.parse(
                                                            text.toString()) *
                                                        int.parse(
                                                            salesPriceUnitController
                                                                .text))
                                                    .toString();
                                                totalAmt =
                                                    (double.parse(subTotal) +
                                                            double.parse(tax))
                                                        .toString();
                                              });
                                            }
                                          },
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "QTY",
                                            hintStyle: AppStyle
                                                .textstylerobotoromanregular16
                                                .copyWith(
                                              fontSize: 12,
                                              color: ColorConstant.black900,
                                            ),
                                            counterText: "",
                                            enabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                          ),
                                          style: TextStyle(
                                              color: ColorConstant.gray500,
                                              fontSize: 15,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              backgroundColor: Colors.white),
                                        ),
                                      ),
                                      */ /* Text(
                     "12",
                      style: Theme.of(context)
                          .textTheme
                          .caption),*/ /*
                                      SizedBox(width: 8.0),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            setState(() {
                                              if (quantityController
                                                      .text.length ==
                                                  0)
                                                quantityController.text = "0";
                                              quantityController
                                                  .text = (int.parse(
                                                          quantityController
                                                              .text) +
                                                      1)
                                                  .toString();
                                              if (salesPriceUnitController
                                                  .text
                                                  .toString()
                                                  .isNotEmpty) {
                                                subTotal = (double.parse(
                                                            quantityController
                                                                .text
                                                                .toString()) *
                                                        int.parse(
                                                            salesPriceUnitController
                                                                .text))
                                                    .toString();
                                                totalAmt =
                                                    (double.parse(subTotal) +
                                                            double.parse(tax))
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          InkWell(
            onTap: () {
*/ /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemDetailsPage()));*/ /*
            },
            child:
                */ /* Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "Sale Price",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                                "₹ 0.0",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "Sale Price",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                                "₹ 0.0",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "Sale Price",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                                "50",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "HSN",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                               "hsn",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "Unit",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                                "unit",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 0,
                              ),
                              child: Text(
                                "Total Price",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                right: 0,
                              ),
                              child: Text(
                                "₹ 100",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),*/ /*

                Column(
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
                              left: 10,
                              top: 10,
                              right: 0,
                            ),
                            child: Text(
                              "Sale Price",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                fontSize: 11,
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              "Purchase Price",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                fontSize: 11,
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 0,
                              top: 10,
                              right: 10,
                            ),
                            child: Text(
                              "Qty",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
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
                            padding: EdgeInsets.only(left: 13, top: 10),
                            child: Text(
                              "₹ 0.0",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                color: ColorConstant.black900,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.only(right: 18, top: 10),
                            child: Text(
                              "₹ 0.0",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                color: ColorConstant.black900,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 0,
                              top: 10,
                              right: 10,
                            ),
                            child: Text(
                              "5",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: AppStyle.textstylerobotoromanregular104
                                  .copyWith(
                                color: ColorConstant.black900,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.67,
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                bottom: 5,
                              ),
                              child: Text(
                                "HSN",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                // left: 15,
                                top: 10,
                              ),
                              child: Text(
                                "Unit",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  fontSize: 11,
                                  height: 0.80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                                top: 10,
                                right: 10,
                              ),
                              child: Text(
                                "Total",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
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
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                "hsn786786",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                right: 0,
                                bottom: 5,
                              ),
                              child: Text(
                                "unit",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                                top: 5,
                                right: 10,
                              ),
                              child: Text(
                                "₹ 100",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppStyle.textstylerobotoromanregular104
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ]),
          ),*/
        ],
      ),
    );
  }
}
