import 'dart:collection';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thikdr/ui/estimate/addestimate/widgets/item_widget.dart';
import 'package:thikdr/ui/estimatequotation/itemestimate/add_items.dart';
import 'package:contacts_service/contacts_service.dart';

import '../../../database/note.dart';
import '../../../database/notes_db.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/progress_dialog_utils.dart';

import 'package:intl/intl.dart';

import '../../estimatequotation/itemestimate/add_item_estimate.dart';
import '../../projectsummary/payment/addparty/widgets/add_party_item_widget.dart';
import 'model/item_model.dart';

class AddEstimatePage extends StatefulWidget {
  @override
  State<AddEstimatePage> createState() => _AddEstimateState();
}

class _AddEstimateState extends State<AddEstimatePage> {

  TextEditingController customerNameController = TextEditingController();
  TextEditingController refNoController = TextEditingController();
  TextEditingController customDayController = TextEditingController();

  var selectedDate = "DD/MM/YYYY";
  var quotationValidity = "7";
  var dayList = [
    "7",
    "15",
    "30",
    "45",
    "60",
    "90",
    //"Custom",
  ];

  String addparty = 'Add New party';
  String validityDate = "DD/MM/YYYY";
  String quotationDate = "DD/MM/YYYY";


  var customerNameAdded=false;

  TextEditingController amountReceivedController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyMobileController = TextEditingController();
  TextEditingController partyGSTController = TextEditingController();
  TextEditingController partyStateController = TextEditingController();
  TextEditingController partyAddressController = TextEditingController();

  ScrollController _controller = new ScrollController();

  List<Contact>? _contactsOriginal=[];
  List<Contact>? _contactsFilter=[];
 /* List<Note>? _contactsOriginal=[];
  List<Note>? _contactsFilter=[];*/

  List<ItemModel> _itemList=[];
  var itemSubtotal='0.0';
  var itemTotal='0.0';
  /////////////

  @override
  void initState() {
    super.initState();
    _itemList.add(ItemModel("Sample Item","Service","10920","BOX","100","80","12","2"));
    _itemList.add(ItemModel("Sample Item1","Product","10929","PCS","105","85","8","1"));
    for(int i=0;i<_itemList.length;i++){
      var total = double.parse(_itemList[i].salePrice)*double.parse(_itemList[i].qty);
      var totalGst =((total)*double.parse(_itemList[i].gst))/100;
      itemSubtotal=(double.parse(itemSubtotal)+total+totalGst).toStringAsFixed(2);
      itemTotal=(double.parse(itemTotal)+total+totalGst).toStringAsFixed(2);
    }
    getToday();
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
          "Estimate / Quotation".toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle.textstylerobotobold20.copyWith(
            fontSize: getFontSize(
              20,
            ),
            height: 0.80,
          ),
        ),
      ),
      backgroundColor: ColorConstant.whiteA700,
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: getHorizontalSize(
            14.00,
          ),
          top: getVerticalSize(
            10.00,
          ),
          bottom: getVerticalSize(
            12.00,
          ),
          right: getHorizontalSize(
            17.00,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 50,
               margin: EdgeInsets.only(right: 10),
               /* width: getHorizontalSize(
                  (MediaQuery.of(context).size.width / 2),
                ),*/
                decoration:
                AppDecoration.textstylerobotoromanbold13,
                child: Text(
                  "Save & New".tr,
                  textAlign: TextAlign.left,
                  style:
                  AppStyle.textstylerobotoromanbold13.copyWith(
                    fontSize:16,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child:  Container(
                alignment: Alignment.center,
                height: 50, margin: EdgeInsets.only(left: 10),
               /* width: getHorizontalSize(
                  (MediaQuery.of(context).size.width / 2),
                ),*/
                decoration:
                AppDecoration.textstylerobotoromanbold13,
                child: Text(
                  "Save",
                  textAlign: TextAlign.left,
                  style:
                  AppStyle.textstylerobotoromanbold13.copyWith(
                    fontSize: 16,
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
        child: Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 80,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: getVerticalSize(
                      2.00,
                    ),
                    left: getHorizontalSize(
                      16.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.black90040,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                  bottom: 5,
                                ),
                                child: Text(
                                  "Ref No.",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .textstylerobotoromanregular165
                                      .copyWith(
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    height: 1.00,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(
                                150.00,
                              ),
                              height: 40,
                              margin: EdgeInsets.only(
                                left: 7,
                                bottom: getVerticalSize(
                                  17.00,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  12.00,
                                ),
                              ),
                              decoration: AppDecoration
                                  .textstylerobotoromanbold166
                                  .copyWith(
                                      borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  15.00,
                                ),
                              )),
                              child: TextField(
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanbold166
                                    .copyWith(
                                  fontSize: 12,
                                  height: 1.00,
                                ),
                                controller: refNoController,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 5,
                                        bottom: 10,
                                        top: 5,
                                        right: 5),
                                    hintText: "Ref no"),
                              ),
                            ),
                          ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => showCalendar(false, "0"),
                            child: Container(
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  27.00,
                                ),
                                top: getVerticalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  8.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 2, bottom: 2),
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
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        4.00,
                                      ),
                                      top: getVerticalSize(
                                        3.00,
                                      ),
                                      bottom: getVerticalSize(
                                        3.00,
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
                                        ImageConstant.imgCalendar,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        10.00,
                                      ),
                                      top: getVerticalSize(
                                        6.00,
                                      ),
                                      bottom: getVerticalSize(
                                        6.00,
                                      ),
                                    ),
                                    child: Text(
                                      selectedDate,
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
                                      left: getHorizontalSize(
                                        10,
                                      ),
                                      top: getVerticalSize(
                                        10.00,
                                      ),
                                      right: getHorizontalSize(
                                        12.49,
                                      ),
                                      bottom: getVerticalSize(
                                        9.53,
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
                          ),
                          InkWell(
                            onTap: () => {showValidityDay()},
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                right: 10,
                              ),
                              child: Text(
                                "Valid for " + quotationValidity + " Days",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppStyle
                                    .textstylerobotoromanregular16
                                    .copyWith(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        height: 1.00,
                                        color: ColorConstant.blue300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                 /* height: getVerticalSize(
                    632.00,
                  ),*/
                  /* width: getHorizontalSize(
                    377.00,
                  ),*/
                  margin: EdgeInsets.only(
                    left: 15,
                    top: 10,
                    right:15,
                  ),
                  padding: EdgeInsets.only(
                    top: 6,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          right: getHorizontalSize(
                            1.00,
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: ColorConstant.gray101,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          mainAxisAlignment:
                              MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, top: 8, right: 8),
                              height: getVerticalSize(
                                60.00,
                              ),
                              width: getHorizontalSize(
                                MediaQuery.of(context).size.width,
                              ),
                              decoration: AppDecoration
                                  .textstylerobotoromanbold166
                                  .copyWith(
                                      borderRadius:
                                          BorderRadius.circular(
                                getHorizontalSize(
                                  15.00,
                                ),
                              )),
                              child: TextField(
                              /*  onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(
                                          new FocusNode());
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddPartyPage()))
                                      .then((value) => {
                                            setState(() {
                                              customerNameController
                                                  .text = (value as Map<
                                                          String,
                                                          dynamic>)[
                                                      'name'] +
                                                  '\n' +
                                                  (value as Map<
                                                          String,
                                                          dynamic>)[
                                                      'mobile'];
                                            })
                                          });
                                },*/
                                controller: customerNameController,
                                onChanged:(text) {
                                  setState(() {
                                    if(text != partyNameController.text) {
                                      addparty = 'Add details for ${text}';
                                      partyNameController.text =
                                          text;

                                      if (text.length > 2) {
                                        _contactsFilter =
                                            _contactsOriginal
                                                ?.where((item) {
                                              //return (item.displayName!.toLowerCase().contains(text.toString().toLowerCase()));
                                              return (item
                                                  .displayName!
                                                  .toLowerCase()
                                                  .contains(
                                                  text.toString()
                                                      .toLowerCase()));
                                            }).toList();
                                      } else
                                        _contactsFilter = [];

                                      customerNameAdded = true;
                                      print("edit onChanged");
                                    }
                                  });

                                },
                                //filterPartyList(customerNameController.text.toString()),


                                //     (addparty){
                                //   _setState((){
                                //
                                //   });
                                //
                                // },


                                //readOnly: true,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .textstylerobotoromanbold166
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  height: 1.00,
                                  color: ColorConstant.black900
                                ),
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons
                                      .account_circle_outlined),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 15),
                                  hintText: "Customer Name",
                                  hintStyle: AppStyle.textstyleregular16.copyWith(color: ColorConstant.gray500)
                                ),

                              ),
                            ),
                            Visibility(
                              visible: (customerNameAdded)?true:false,
                                child:
                            Container(
                              //height: 400,
                              child:
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    //width: size.width/2-25,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          20.00,
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
                                    child:
                                    InkWell(
                                      onTap: ()=>{
                                        showCustomerDetailsBottomSheet(
                                          customDayController.text.toString()
                                        )
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                17.00,
                                              ),
                                              top: 5,
                                              bottom: 5,
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    ImageConstant.imgUser1,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      11.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      8.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      8.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    addparty,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstyleregular16
                                                        .copyWith(
                                                      fontSize:12,
                                                      height: 1.00,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              right:15,
                                              bottom: 10,
                                            ),
                                            child: Container(
                                              height:8,
                                              width: 8,
                                              child: Image.asset(
                                                ImageConstant.imgArrowRightBlack,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          10.00,
                                        ),
                                        top: getVerticalSize(
                                          5.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                       // controller: _controller,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        // itemCount: _list.length,
                                        itemCount: _contactsFilter?.length,
                                        itemBuilder: (context, index) {
                                        //  Note model = _contactsFilter![index];
                                          Contact model = _contactsFilter![index];
                                          return AddPartyItemWidget(
                                              model,
                                              index,
                                              onTileSelected
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            ),
                            Visibility(
                              visible: _itemList.length<1,
                              child: InkWell(
                                onTap: () {
                                  gotoNextPage(context,-1);
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        25.00,
                                      ),
                                      top: 20,
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                      bottom: getVerticalSize(
                                        20.00,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(
                                        getHorizontalSize(
                                          5.00,
                                        ),
                                      ),
                                      border: Border.all(
                                        color: ColorConstant.red201,
                                        width: getHorizontalSize(
                                          1.00,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              94.00,
                                            ),
                                            top: getVerticalSize(
                                              13.00,
                                            ),
                                            bottom: getVerticalSize(
                                              13.00,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(
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
                                                ImageConstant
                                                    .imgPlusRed,
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
                                              10.00,
                                            ),
                                            right: getHorizontalSize(
                                              93.00,
                                            ),
                                            bottom: getVerticalSize(
                                              9.00,
                                            ),
                                          ),
                                          child: Text(
                                            //"ADD ITEMS(OPTIONAL)",
                                            "ADD ITEMS",
                                            overflow:
                                                TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .textstylerobotoromanbold133
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
                                ),
                              ),
                            ),

                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top:10,left: 10,bottom: 5),
                                    child: Text(
                                      "ITEMS",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        height: 1.00,
                                        color: ColorConstant.black900,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      gotoNextPage(context,-1);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                                      child: Text(
                                        "+ Add Item",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotoromanbold16.copyWith(
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          height: 1.00,
                                          color: ColorConstant.blue500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    5.00,
                                  ),
                                  right: getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  // controller: _controller,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  // itemCount: _list.length,
                                  itemCount: _itemList.length,
                                  itemBuilder: (context, index) {
                                    ItemModel model = _itemList[index];
                                    return ItemWidget(
                                        model,
                                        index,
                                        onItemSelected
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:5,left: 8,right: 8),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                               /* boxShadow: [
                                  BoxShadow(
                                    color:
                                    ColorConstant.black90040,
                                    spreadRadius:
                                    getHorizontalSize(
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
                                ],*/
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "Item Subtotal",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        height: 1.00,
                                        color: ColorConstant.black900,
                                        fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₹${itemSubtotal}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        height: 1.00,
                                        color: ColorConstant.black900,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          boxShadow: [
                            BoxShadow(
                              color:
                              ColorConstant.black90040,
                              spreadRadius:
                              getHorizontalSize(
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
                        padding: EdgeInsets.only(left: 5,right: 5,top:10,bottom: 10),
                        margin: EdgeInsets
                            .only(
                          left:
                             2,
                          top:
                              10,
                          bottom:
                              10,
                          right:
                             1,
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: <
                              Widget>[
                            Text(
                              "Total Amount",
                              style:
                                  TextStyle(
                                color: ColorConstant
                                    .black900,
                                fontSize:
                                    getFontSize(
                                  16,
                                ),
                                fontFamily:
                                    'Roboto',
                                fontWeight:
                                    FontWeight
                                        .w700,
                                height:
                                    1.00,
                              ),
                            ),
                            Text(
                              "₹ $itemTotal",
                              style:
                                  TextStyle(
                                color: ColorConstant
                                    .gray802,
                                fontSize:
                                    getFontSize(
                                  16,
                                ),
                                fontFamily:
                                    'Roboto',
                                fontWeight:
                                    FontWeight
                                        .w700,
                                height:
                                    1.00,
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
          ),
        ),
      ),
    ));
  }

  void showQuotationBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Edit Quotation Date and Number",
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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Quotation Date",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular123.copyWith(
                      fontSize: getFontSize(16),
                      height: 1.40,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  /* Navigator.pop(context);
                  if(double.parse(subTotal)>0) {
                    setState(() {
                      taxPercent = "None-0.0%";
                      tax = ((double.parse(subTotal) * 0.0) / 100).toString();
                      totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                    });
                  }else
                    showMsg("Please fill quantity and rate price!");*/
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: getHorizontalSize(
                      15.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
                    border: Border.all(
                      color: ColorConstant.red201,
                      width: getHorizontalSize(
                        1.00,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () => {showCalendar(false, "0")},
                        child: Text(
                          quotationDate,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular123.copyWith(
                            fontSize: getFontSize(
                              16,
                            ),
                            height: 1.40,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          ImageConstant.imgCalendar,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Validity Date",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanregular123.copyWith(
                      fontSize: getFontSize(16),
                      height: 1.40,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  /* Navigator.pop(context);
                  if(double.parse(subTotal)>0) {
                    setState(() {
                      taxPercent = "None-0.0%";
                      tax = ((double.parse(subTotal) * 0.0) / 100).toString();
                      totalAmt=(double.parse(subTotal)+double.parse(tax)).toString();
                    });
                  }else
                    showMsg("Please fill quantity and rate price!");*/
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                    left: getHorizontalSize(
                      15.00,
                    ),
                    right: getHorizontalSize(
                      15.00,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        5.00,
                      ),
                    ),
                    border: Border.all(
                      color: ColorConstant.red201,
                      width: getHorizontalSize(
                        1.00,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children:[
                      InkWell(
                        onTap: () => {showCalendar(true, quotationValidity)},
                        child: Text(
                          validityDate,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular123.copyWith(
                            fontSize: getFontSize(
                              16,
                            ),
                            height: 1.40,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => showValidityDay(),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  5.00,
                                ),
                              ),
                              color: ColorConstant.gray300,
                              border: Border.all(
                                color: ColorConstant.gray300,
                                width: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Text(quotationValidity + " Days")),
                                SvgPicture.asset(
                                  ImageConstant.imgArrowDown,
                                  color: ColorConstant.black900,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            )),
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

  void showCalendar(bool isQuotationDate, validityDay) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now()
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate);

      final updatedDate = DateTime(pickedDate.year, pickedDate.month,
          pickedDate.day + int.parse(validityDay));

      String formattedDate = DateFormat('dd/MM/yyyy').format(updatedDate);
      print(formattedDate);

      //setState(() { _setState = setState; });

      setState(() {
        /* if (isQuotationDate)
          quotationDate = formattedDate;
        else
          validityDate = formattedDate;*/
        selectedDate = formattedDate;
      });
    } else {}
  }

  void showValidityDay() {
    var selectedIndex = -1;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /* Padding(
                padding: EdgeInsets.all(10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Edit Quotation Date and Number",
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
              ),*/
              /* InkWell(
                onTap: ()=>showValidityDay(),
                child:*/
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  /*gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,childAspectRatio: (3 / 2)
          ),*/
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dayList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(5),
                        // margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              5.00,
                            ),
                          ),
                          color: ColorConstant.gray300,
                          border: Border.all(
                            color: (selectedIndex == index)
                                ? ColorConstant.red300
                                : ColorConstant.gray300,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () => {
                            setState(() {
                              selectedIndex = index;
                             // if(index!=5) {
                                quotationValidity = dayList[index];
                                Navigator.of(context).pop();
                             // }
                            })
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             // if(index!=5)
                              Text(dayList[index]),
                             /* if(index==5)
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5,bottom: 10),
                                    width: 30,
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 2,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotoromanbold166
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.00,
                                        color: ColorConstant.black900,
                                        fontWeight: FontWeight.normal
                                      ),
                                      controller:customDayController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.all(1),
                                        hintText: "Custom",
                                      counterText: ""),
                                    ),
                                  ),
                                ),*/
                              Text(" Days"),
                              /* SvgPicture.asset(
                                    ImageConstant.imgArrowDown,
                                    color: ColorConstant.black900,
                                    fit: BoxFit.fill,
                                  ),*/
                            ],
                          ),
                        ));
                  },
                ),
              ),
              /* GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dayList.length,
                  itemBuilder: (context, index) {
                    return
                  },
                ),*/
              // ),
            ],
          );
        });
  }

  void getToday() {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    setState(() {
      selectedDate = formattedDate;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(mounted)
        ProgressDialogUtils().progressDialogue(context);

      _fetchContacts();
    });
  }


 /* Future _fetchContacts() async {
    List<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
  *//*  setState(() => {
      _contactsOriginal = contacts,
      _contactsFilter = contacts,
    });*//*


    var allContacts =await NotesDatabase.instance.readAllNotes();
    if(contacts.length!=allContacts.length){
      await NotesDatabase.instance.deleteAll();
      for(Contact contact in contacts) {
        addNote(contact.displayName.toString(),
            contact.phones?[0].value.toString());
      }
    }

    allContacts =await NotesDatabase.instance.readAllNotes();

    setState(() => {
      _contactsOriginal = allContacts,
      _contactsFilter = allContacts,
    });

    ProgressDialogUtils().hideProgressDialog(context,mounted);

  }*/

  // Function to get permission from the user
  _contactsPermissions() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted && permission != PermissionStatus.denied) {
      Map<Permission, PermissionStatus> permissionStatus = await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }

  Future<bool> askPermission() async{
    PermissionStatus status = await Permission.contacts.request();
    if(status.isDenied == true)
    {
      askPermission();
    }
    else
    {
      return true;
    }

    return false;
  }

  //Function to import contacts
  _fetchContacts() async {
    bool contactsPermissionsStatus = await askPermission();
    print("permission status :: "+contactsPermissionsStatus.toString());
    if (contactsPermissionsStatus == true) {
     // List<Contact> _contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();

      var _contacts = await ContactsService.getContacts(
        withThumbnails: false,
        photoHighResolution: false,
      );

      for(int i=0;i<_contacts.length;i++){
        if(_contacts[i].phones!=null && _contacts[i].phones!.length>0)
        print("Name : ${_contacts[i].phones?[0].value.toString()}");
      }

     /* var allContacts =await NotesDatabase.instance.readAllNotes();
      if(_contacts.length!=allContacts.length){
        await NotesDatabase.instance.deleteAll();
        for(Contact contact in _contacts) {
          addNote(contact.displayName.toString(),
             ((contact.phones!.length>0)?contact.phones![0].value.toString():""));
        }
      }

      allContacts =await NotesDatabase.instance.readAllNotes();*/

      setState(() => {
        setState ((){
          addparty = ' ${partyNameController.text.toString()}';
        }),
        _contactsOriginal = _contacts,
      //  _contactsFilter = _contacts,
      });

      ProgressDialogUtils().hideProgressDialog(context,mounted);
    }
  }

  Future addNote(title,number) async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number ?? "",
      description: "description",
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }

  void showCustomerDetailsBottomSheet(String name) {
    setState((){
      debugPrint("check kr${name}");
      // name = ' ${customerNameController.text.toString()}';
      // partyNameController.text= name;
      // // partyNameController.text= addparty;
    });

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
                  padding:
                  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Add Party Name',
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
                              child: SizedBox(
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "Party name",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        /*width: getHorizontalSize(
                  150.00,
                ),*/
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7, right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  bottom: 10,
                                  top: 5,
                                  right: 5),
                              hintText: "Party name"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "Party mobile",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          maxLength: 15,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyMobileController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 5,
                                bottom: 10,
                                top: 5,
                                right: 5),
                            hintText: "Party mobile",
                            counterText: "",),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "GST number(optional)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        /*width: getHorizontalSize(
                  150.00,
                ),*/
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left:8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          maxLength: 15,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyGSTController,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 5,
                                bottom: 10,
                                top: 5,
                                right: 5),
                            hintText: "GST number(optional)",
                            counterText: "",),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            "State(optional)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular123.copyWith(
                              fontSize: getFontSize(16),
                              height: 1.40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        /*width: getHorizontalSize(
                  150.00,
                ),*/
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.only(
                          left:8,
                        ),
                        decoration:
                        AppDecoration.textstylerobotoromanbold166.copyWith(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                15.00,
                              ),
                            )
                        ),
                        child: TextField(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanbold166
                              .copyWith(
                            fontSize: 12,
                            height: 1.00,
                          ),
                          controller: partyStateController,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  bottom: 10,
                                  top: 5,
                                  right: 5),
                              hintText: "State(optional)"),
                        ),
                      ),
                      Center(
                        child:
                        ElevatedButton(
                          child:
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                              child: Text('SAVE')),
                          onPressed: () => {

                            //Navigator.pop(context),
                            Navigator.pop(context, {

                              //'name': (_itemModel),
                              'name': partyNameController.text.toString(),

                              'mobile': partyMobileController.text.toString(),
                            }),
                            setState((){
                              customerNameController.text= partyNameController.text.toString();
                              customerNameAdded = false;
                            })
                            // backToPreviousPage()
                          },
                        ),
                      ),
                    ],
                  )
              ));
        });
  }

  onTileSelected(int index) {
    setState((){
     /* partyNameController.text=((_contactsFilter?[index].displayName != null)?(_contactsFilter?[index].displayName):"")!;
      partyMobileController.text=((_contactsFilter?[index].phones != null && (_contactsFilter?[index].phones?.length)!>0 &&
          _contactsFilter?[index].phones![0] != null)?(_contactsFilter?[index].phones![0].value.toString()):"")!;
      */
       partyNameController.text=((_contactsFilter?[index].displayName != null)?(_contactsFilter?[index].displayName):"")!;
      partyMobileController.text=((_contactsFilter?[index].phones != null && (_contactsFilter?[index].phones?.length)!>0 &&
          _contactsFilter?[index].phones![0] != null)?(_contactsFilter?[index].phones![0].value.toString()):"")!;
      showCustomerDetailsBottomSheet('');
    });
  }
  onItemSelected(int index) {
    setState((){
      gotoNextPage(context,index);
    });
  }

  filterPartyList(text) {
    setState((){
      addparty = 'Add details for ${text}';
      partyNameController.text=text;
      print('addparty$addparty',);
      if(text.length>2){
        _contactsFilter  = _contactsOriginal?.where((item) {
          //return (item.displayName!.toLowerCase().contains(text.toString().toLowerCase()));
          return (item.displayName!.toLowerCase().contains(text.toString().toLowerCase()));
        }).toList();
      }else
        _contactsFilter=[];


      print('_contactsFilter ${_contactsFilter!.length.toString()}',);

    });
  }

  Future<void> gotoNextPage(BuildContext context,index) async{
    if(index>=0)
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddItemEstimatePage(name:_itemList[index].itemName,itemType:_itemList[index].itemType,
            salePrice:_itemList[index].salePrice, purchasePrice: _itemList[index].purchasePrice,
            qty: int.parse(_itemList[index].qty),hsn: _itemList[index].hsn,unit: _itemList[index].unit,
        gst: _itemList[index].gst)));
    else
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddItemsPage(ItemModel(null,null,null,null,
            null,null,null,null))));

    /*final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemEstimatePage()),
    );
    if (result != null) {
      setState((){
        totalAmt = (result as Map<String,dynamic>)["total"];
      });

      print(
          (result as Map<String, dynamic>)['itemName'] +", "+
              (result as Map<String,dynamic>)["itemType"]+", "+
              (result as Map<String,dynamic>)["quantity"]+", "+
              (result as Map<String,dynamic>)["unit"]+", "+
              (result as Map<String,dynamic>)["ratePrice"]+", "+
              (result as Map<String,dynamic>)["hsn"]+", "+
              (result as Map<String,dynamic>)["gst"]+", "+
              (result as Map<String,dynamic>)["total"]
      );
    }*/
  }

  updatePartyName(TextEditingController customerNameController) {
    setState ((){
      addparty = 'Add details for ${customDayController.text.toString()}';
    });
}}
