
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/database/note.dart';
import 'package:thikdr/ui/projectsummary/payment/addparty/models/add_party_item_model.dart';
import 'package:thikdr/ui/projectsummary/payment/addparty/widgets/add_party_item_widget.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import '../../../../utils/progress_dialog_utils.dart';

class AddPartyPage extends StatefulWidget {
  @override
  State<AddPartyPage> createState() => _AddPartyState();
}

class _AddPartyState extends State<AddPartyPage> {

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

  List<AddPartyItemModel> _list=[
    AddPartyItemModel('Party Name 1','8759098477'),
    AddPartyItemModel('Party Name 2','8759098677'),
  ];

  List<Contact>? _contactsOriginal=[];
  List<Contact>? _contactsFilter=[];
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(mounted)
        ProgressDialogUtils().progressDialogue(context);

      _fetchContacts();
    });
  }

  Future _fetchContacts() async {
    List<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() => {
      _contactsOriginal = contacts,
      _contactsFilter = contacts,
    });

    ProgressDialogUtils().hideProgressDialog(context,mounted);
   /* if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
    }*/
  }

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
            "ADD PARTY",
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
        body: Container(
          margin: EdgeInsets.only(top:getVerticalSize(20)),
          decoration: BoxDecoration(
            color: ColorConstant.gray51,
          ),
          child:ListView(
           /* mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,*/
            children: [
              Container(
                height: getVerticalSize(
                  50.00,
                ),
                margin: EdgeInsets.only(left: getVerticalSize(10),right: getVerticalSize(10)),
                child: TextFormField(
                  controller: searchController,
                  onChanged:(text) {
                    filterPartyList(text);
                  },
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: AppStyle.textstylerobotoromanregular147.copyWith(
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
              Container(
                //width: size.width/2-25,
                margin: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),
                  top: getVerticalSize(10),bottom: getVerticalSize(10),),
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
                    showCustomerDetailsBottomSheet()
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
                                38.00,
                              ),
                              width: getSize(
                                38.00,
                              ),
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
                                "Add new party",
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
                            24.00,
                          ),
                          right: getHorizontalSize(
                            22.00,
                          ),
                          bottom: getVerticalSize(
                            24.00,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            15.00,
                          ),
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
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: getHorizontalSize(15),right: getHorizontalSize(250),
                    top: getVerticalSize(10)),
                padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),
                    top: getVerticalSize(7),bottom: getVerticalSize(7)),
                decoration:
                AppDecoration.textstylerobotoromanbold147.copyWith(
                  color: ColorConstant.blue500,
                ),
                child: Text(
                  "Company Parties",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanbold147
                      .copyWith(
                      fontSize: getFontSize(
                        16,
                      ),
                      height: 1.14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      5.00,
                    ),
                    right: getHorizontalSize(
                      16.00,
                    ),
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                   // itemCount: _list.length,
                    itemCount: _contactsFilter?.length,
                    itemBuilder: (context, index) {
                     // AddPartyItemModel model = _list[index];
                      Contact model = _contactsFilter![index];
                      //Note model = _contactsFilter![index] as Note;
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
        ),
      ),
    );
  }


  void showCustomerDetailsBottomSheet() {
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Add New Party",
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly

                  ],
                  maxLength: 15,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanbold166
                      .copyWith(
                    fontSize: 12,
                    height: 1.00,
                  ),
                  controller: partyMobileController,
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
                child: ElevatedButton(
                  child: Text('SAVE'),
                  onPressed: () => {
                    Navigator.pop(context),
                    Navigator.pop(context, {
                      //'name': (_itemModel),
                      'name': partyNameController.text.toString(),
                      'mobile': partyMobileController.text.toString(),
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
      partyNameController.text=((_contactsFilter?[index].displayName != null)?(_contactsFilter?[index].displayName):"")!;
      partyMobileController.text=((_contactsFilter?[index].phones != null && (_contactsFilter?[index].phones?.length)!>0 &&
          _contactsFilter?[index].phones![0] != null)?(_contactsFilter?[index].phones![0].value.toString()):"")!;
      showCustomerDetailsBottomSheet();
    });
  }

  filterPartyList(text) {
    setState((){
      if(text.length>0){
      _contactsFilter  = _contactsOriginal?.where((item) {
        return (item.displayName!.toLowerCase().contains(text.toString().toLowerCase()));
      }).toList();
      }
    });
  }
}

