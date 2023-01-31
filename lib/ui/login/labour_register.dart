import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thikdr/ui/login/skill_model.dart';
import 'package:thikdr/utils/color_constant.dart';
import 'package:thikdr/utils/image_constant.dart';

import '../../network/webservice.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/dialog/dialog_page.dart';
import '../../utils/pref_utils.dart';
import '../home/home.dart';
import 'mvvm_login/check_user_model.dart';

class LabourRegisterPage extends StatefulWidget {
  String mobile = "";
  String id = "";

  LabourRegisterPage({required this.id, required this.mobile});

  @override
  State<LabourRegisterPage> createState() => _LabourRegisterState();
}

class _LabourRegisterState extends State<LabourRegisterPage> {
  int radioGroupMale = 1;
  int radioGroupFemale = 1;
  int isMale = 1;
  int isFemale = 0;
  int gender = 1;

  static List<SkillList> _skillModels = [];
  static List<SkillList> _city = [];

  var _items = _skillModels
      .map((skillModel) =>
          MultiSelectItem<SkillList>(skillModel, skillModel.name.toString()))
      .toList();
  List<SkillList> _selectedSkillModels = [];

  var _itemsCity = _city
      .map((skillModel) =>
          MultiSelectItem<SkillList>(skillModel, skillModel.name.toString()))
      .toList();
  List<SkillList> _selectedCityModels = [];

  TextEditingController enterNameController = TextEditingController();
  TextEditingController ageEnterageController = TextEditingController();
  TextEditingController enterDailyRatController = TextEditingController();
  TextEditingController selectExpatriaController = TextEditingController();
  TextEditingController selectWorkLocController = TextEditingController();

  var selectedSkill = "Select Expatriates Skill Options";
  var selectedLocation = "Select Work City";
  var lat = 0.0;
  var lng = 0.0;

  @override
  void initState() {
    super.initState();

    _getLocation(context);
    getData();
  }

  void getData() async {
    if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    } else {
      getSkills();
      getLanguage();
    }
  }

  void _getLocation(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('lat') &&
        !prefs.containsKey('lng') &&
        !prefs.containsKey('lnga')) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        bool isLocationServiceEnableds =
            await Geolocator.isLocationServiceEnabled();
        if (isLocationServiceEnableds) {
          getLoc();
        } else {
          getLoc();
          //showAlertDialog(context, locale, 'opens');
        }
      } else if (permission == LocationPermission.denied) {
        //  showAlertDialog(context, locale, 'openp');
      } else if (permission == LocationPermission.deniedForever) {
        // showAlertDialog(context, locale, 'openas');
      }
    } else {
      /*double latw = double.parse('${prefs.getString('lat')}');
      double lngw = double.parse('${prefs.getString('lng')}');*/
      double latw = double.parse('0.0');
      double lngw = double.parse('0.0');
      print('$latw - $lngw');
      if (latw != null && lngw != null && latw > 0.0 && lngw > 0.0) {
        // hitAddressPlace(latw, lngw);
      } else {
        prefs.remove('lat');
        prefs.remove('lng');
        getLoc();
        //_getLocation(context, locale);
      }
    }
  }

  void getLoc() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 4));
    double lat = position.latitude;
    double lng = position.longitude;
    print("lat : " + lat.toString() + " lng : " + lng.toString());

    if (lat > 0 && lng > 0) {
      //_getAddressFromLatLng(lat,lng);
    } else
      getLoc();
    //get
    if (mounted)
      setState(() {
        this.lat = lat;
        this.lng = lng;
      }); /*
    prefs.setString("lat", lat.toString());
    prefs.setString("lng", lng.toString());
    prefs.setString("userLat", lat.toString());
    prefs.setString("userLng", lng.toString());
   // hitAddressPlace(lat, lng);*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Labour Register',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 0,
                    right: 15,
                  ),
                  child: Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextFormField(
                      controller: enterNameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: AppStyle.textstylerobotoromanbold16.copyWith(
                          fontSize: 16,
                          color: ColorConstant.gray500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 10,
                          ),
                          child: Container(
                            height: 28,
                            width: 28,
                            child: Image.asset(
                              ImageConstant.imgUser,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 28,
                          minHeight: 48,
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      style: TextStyle(
                        color: ColorConstant.gray500,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 21,
                          ),
                          child: Row(
                            children: [
                              Radio(
                                activeColor: ColorConstant.redA400,
                                value: isMale,
                                groupValue: radioGroupMale,
                                onChanged: (value) {
                                  setState(() {
                                    isMale = 1;
                                    isFemale = 0;
                                    gender = 1;
                                  });
                                },
                              ),
                              Text(
                                "Male",
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular13
                                    .copyWith(
                                  fontSize: 13,
                                  height: 1.23,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 14,
                            right: 10,
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: isFemale,
                                groupValue: radioGroupFemale,
                                onChanged: (value) {
                                  setState(() {
                                    isMale = 0;
                                    isFemale = 1;
                                    gender = 0;
                                  });
                                },
                              ),
                              Text(
                                "Female",
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular13
                                    .copyWith(
                                  fontSize: 13,
                                  height: 1.23,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21,
                    top: 19,
                    right: 16,
                  ),
                  child: Container(
                    height: 84,
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextFormField(
                      controller: ageEnterageController,
                      maxLength: 2,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                      ],
                      decoration: InputDecoration(
                        hintText: "Age(18-99)",
                        hintStyle: AppStyle.textstylerobotoromanbold16.copyWith(
                          fontSize: 16,
                          color: ColorConstant.gray500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 10,
                          ),
                          child: Container(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              ImageConstant.imgAge,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 28,
                          minHeight: 48,
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      style: TextStyle(
                        color: ColorConstant.gray500,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21,
                    top: 20,
                    right: 16,
                  ),
                  child: Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextFormField(
                      controller: enterDailyRatController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                      ],
                      decoration: InputDecoration(
                        hintText: "Daily Rate",
                        hintStyle: AppStyle.textstylerobotoromanbold16.copyWith(
                          fontSize: 16,
                          color: ColorConstant.gray500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 10,
                          ),
                          child: Container(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              ImageConstant.imgRate,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 28,
                          minHeight: 48,
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      style: TextStyle(
                        color: ColorConstant.gray500,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21,
                    top: 20,
                    right: 16,
                  ),
                  child: Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _showMultiSelect(context);
                      },
                      controller: selectExpatriaController,
                      decoration: InputDecoration(
                        hintText: selectedSkill,
                        hintStyle: AppStyle.textstylerobotoromanbold16.copyWith(
                          fontSize: 16,
                          color: ColorConstant.gray500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 10,
                          ),
                          child: Container(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              ImageConstant.imgBag,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 28,
                          minHeight: 48,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 26,
                          ),
                          child: Container(
                            height: 8,
                            width: 15,
                            child: SvgPicture.asset(
                              ImageConstant.imgArrowDown,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 8,
                          minHeight: 8,
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      style: TextStyle(
                        color: ColorConstant.gray500,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                /* Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 35,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray100,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  top: 12,
                                  right: 15,
                                ),
                                child: Text(
                                  "Skill (Choose one or more)",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanbold14
                                      .copyWith(
                                    fontSize: 14,
                                    height: 1.14,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 14,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "msg_aluminium_glass",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "msg_carpenter_furni",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 12,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_electrician",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "msg_excavation_and",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 12,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_fabricator",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "msg_facility_manage",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 12,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_fire_fighting",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                  bottom: 15,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_flooring",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),*/
                Padding(
                  padding: EdgeInsets.only(
                    left: 21,
                    top: 15,
                    right: 16,
                  ),
                  child: Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _showMultiSelectCity(context);
                      },
                      controller: selectWorkLocController,
                      decoration: InputDecoration(
                        hintText: selectedLocation,
                        hintStyle: AppStyle.textstylerobotoromanbold16.copyWith(
                          fontSize: 16,
                          color: ColorConstant.gray500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: ColorConstant.bluegray100,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 7,
                            right: 10,
                          ),
                          child: Container(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              ImageConstant.imgLocation,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 28,
                          minHeight: 48,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 26,
                          ),
                          child: Container(
                            height: 8,
                            width: 16,
                            child: SvgPicture.asset(
                              ImageConstant.imgArrowDown,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 8,
                          minHeight: 8,
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      style: TextStyle(
                        color: ColorConstant.gray500,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                /* Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 35,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray100,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  top: 12,
                                  right: 15,
                                ),
                                child: Text(
                                  "Choose your location",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.textstylerobotoromanbold14
                                      .copyWith(
                                    fontSize: 14,
                                    height: 1.14,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 14,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_kolkata",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_delhi",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 12,
                                  right: 16,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_mumbai",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 16,
                                  top: 11,
                                  right: 16,
                                  bottom: 18,
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 100,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ColorConstant.redA400,
                                          width: 1,
                                        ),
                                      ),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "lbl_bangalore",
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .textstylerobotoromanregular14
                                          .copyWith(
                                        fontSize: 14,
                                        height: 1.14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),*/
                InkWell(
                  onTap: () async {
                    if (enterNameController.text.toString().isEmpty)
                      showMsg("Name should not empty!");
                    else if (ageEnterageController.text.toString().isEmpty)
                      showMsg("Age should not empty!");
                    else if (ageEnterageController.text.toString().isEmpty ||
                        int.parse(ageEnterageController.text.toString()) < 18 ||
                        int.parse(ageEnterageController.text.toString()) > 99)
                      showMsg("Age must be in between(18-99)!");
                    else if (enterDailyRatController.text.toString().isEmpty)
                      showMsg("Daily rate should not empty!");
                    else if (_selectedSkillModels.length == 0)
                      showMsg("Choose skill!");
                    else if (_selectedCityModels.length == 0)
                      showMsg("Choose work city!");
                    else if (!await InternetConnectionChecker().hasConnection) {
                      showMsg("Check internet connection!");
                    } else {
                      progressDialogue(context);
                      labourRegister();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 21,
                      top: 100,
                      right: 14,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: AppDecoration.textstylerobotoromanbold13,
                      child: Text(
                        "CONTINUE",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold13.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> labourRegister() async {
    try {
      CheckUserModel checkUserModel = await Webservice()
          .requestLabourRegistration(
              widget.id,
              "",
              enterNameController.text.toString(),
              widget.mobile,
              (gender == 1) ? "Male" : "Female",
              ageEnterageController.text.toString(),
              enterDailyRatController.text.toString(),
              jsonEncode(_selectedSkillModels),
              jsonEncode(_selectedCityModels),
              lat.toString(),
              lng.toString());

      Navigator.pop(context);

      showMsg(checkUserModel.message);

      if (!checkUserModel.error) {
        PrefUtils().savePreferencesData(
            "token", checkUserModel.data?.token.toString());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
      }

      print('response : ${jsonEncode(checkUserModel)}');
    } catch (e) {
      Navigator.pop(context);
      showMsg(e.toString());
    }
  }

  Future<void> getSkills() async {
    try {
      SkillModel skillModel = await Webservice().requestSkillList();

      if (!skillModel.error!) {
        setState(() {
          _skillModels = skillModel.data!.list!;
          _items = _skillModels
              .map((skillModel) => MultiSelectItem<SkillList>(
                  skillModel, skillModel.name.toString()))
              .toList();
        });
      }

      print('response : ${jsonEncode(skillModel)}');
    } catch (e) {}
  }

  Future<void> getLanguage() async {
    try {
      SkillModel skillModel = await Webservice().requestCityList();

      if (!skillModel.error!) {
        setState(() {
          _city = skillModel.data!.list!;
          _itemsCity = _city
              .map((skillModel) => MultiSelectItem<SkillList>(
                  skillModel, skillModel.name.toString()))
              .toList();
        });
      }

      print('response : ${jsonEncode(skillModel)}');
    } catch (e) {}
  }

  showDropDown() {
    bool isChecked = false;
  }

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      barrierLabel: "Skill (Choose one or more)",
      builder: (ctx) {
        return MultiSelectDialog(
          height: 300,
          items: _items,
          searchable: true,
          searchHint: "Skill",
          initialValue: _selectedSkillModels,
          onConfirm: (values) {
            if(values.length!=0){
              _selectedSkillModels = (values as List<SkillList>);
              selectedSkill="";
              for (var i = 0; i < _selectedSkillModels.length; i++) {
                print("object $i " + _selectedSkillModels[i].name.toString());
                selectedSkill= ((selectedSkill!="")?(selectedSkill+", "):"")+_selectedSkillModels[i].name.toString();
              }

              print("json " + jsonEncode(_selectedSkillModels));
            }

            /*selectedSkill = "";
            _selectedSkillModels = (values as List<SkillList>);
            for (var i = 0; i < _selectedSkillModels.length; i++) {
              print("object $i " + _selectedSkillModels[i].name.toString());
              selectedSkill =
                  ((selectedSkill != "") ? (selectedSkill + ", ") : "") +
                      _selectedSkillModels[i].name.toString();
            }
            print("json " + jsonEncode(_selectedSkillModels));*/
          },
        );
      },
    );
  }

  void _showMultiSelectCity(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Choose your location",
      builder: (ctx) {
        return MultiSelectDialog(
          items: _itemsCity,
          searchable: true,
          searchHint: "City",
          initialValue: _selectedCityModels,
          onConfirm: (values) {
            if(values.length!=0){
              _selectedCityModels = (values as List<SkillList>);
              selectedLocation="";
              for (var i = 0; i < _selectedCityModels.length; i++) {
                print("object $i " + _selectedCityModels[i].name.toString());
                selectedLocation= ((selectedLocation!="")?(selectedLocation+", "):"")+_selectedCityModels[i].name.toString();
              }

              print("json " + jsonEncode(_selectedCityModels));
            }

           /* selectedLocation = "";
            _selectedCityModels = (values as List<SkillList>);
            for (var i = 0; i < _selectedCityModels.length; i++) {
              print("object $i " + _selectedCityModels[i].name.toString());
              selectedLocation =
                  ((selectedLocation != "") ? (selectedLocation + ", ") : "") +
                      _selectedCityModels[i].name.toString();
            }
            print("json " + jsonEncode(_selectedCityModels));*/
          },
        );
      },
    );
  }

  void showMsg(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogPage(message);
        });
  }

  progressDialogue(BuildContext context) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(
            onWillPop: () async {
              debugPrint("popping from route 2 disabled");
              Navigator.pop(context);
              return true;
            },
            child: alert);
      },
    );
  }
}
