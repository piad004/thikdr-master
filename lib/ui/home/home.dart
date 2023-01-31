import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thikdr/ui/home/model/slider/slider_model.dart';
import 'package:thikdr/ui/home/widgets/home_ui_for_contractor_item_widget.dart';
import 'package:thikdr/ui/home/widgets/slider_item_widget.dart';
import 'package:thikdr/ui/projects/ongoing_projects_tab.dart';

import '../../database/app_database.dart';
import '../../database/entity/person.dart';
import '../../localization/Language/languages.dart';
import '../../network/webservice.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';
import '../../utils/utils.dart';
import '../../utils/pref_utils.dart';
import '../../utils/progress_dialog_utils.dart';
import '../changelanguage/change_language_screen.dart';
import '../leads/leaddetails/model/lead_model.dart';
import '../leads/leadstab/latestleads/widgets/leads_item_widget.dart';
import '../login/login.dart';
import 'model/home_ui_for_contractor_item_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with WidgetsBindingObserver {
  TextEditingController unitAreasqfController = TextEditingController();
  TextEditingController unitAreasqfController1 = TextEditingController();

  /* Rx<HomeUiForContractorModel> homeUiForContractorModelObj =
      HomeUiForContractorModel().obs;*/

  late List<HomeUiForContractorItemModel> homeUiForContractorModelObj = [
    HomeUiForContractorItemModel(
        ImageConstant.imgLeads, Languages.of(context)!.homeJob),
    HomeUiForContractorItemModel(
        ImageConstant.imgProject, Languages.of(context)!.homeProject),
    HomeUiForContractorItemModel(
        ImageConstant.imgQuotation, Languages.of(context)!.homeQuotation),
    HomeUiForContractorItemModel(
        ImageConstant.imgInvoice, Languages.of(context)!.homeInvoice),
    HomeUiForContractorItemModel(
        ImageConstant.imgLabour1, Languages.of(context)!.homeLabour),
    HomeUiForContractorItemModel(
        ImageConstant.imgMaterial, Languages.of(context)!.homeMaterial),
    HomeUiForContractorItemModel(
        ImageConstant.imgClient, Languages.of(context)!.homeClient),
    HomeUiForContractorItemModel(
        ImageConstant.imgLegal, Languages.of(context)!.homeLegal),
    HomeUiForContractorItemModel(
        ImageConstant.imgAccount, Languages.of(context)!.homeAccount),
  ];

  List<SliderImgList> _list = [];
  List<LeadList> _popularLeadList = [];

  int silderIndex = 0;
  String userName = "";
  String userBal = "₹ 0";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    //updateMenuName();
    getData();
  }

  void getData() async {
    if (!await InternetConnectionChecker().hasConnection) {
      Utils().showMsg(context,"Check internet connection!");
    } else {
      getUserData();
      getPopularLeads();
    }
  }

  Future<void> getUserData() async {
    try {
      /* final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

      final personDao = database.personDao;
      final person = Person(1, 'Frank');

      await personDao.insertPerson(person);
      var result = await personDao.findPersonById(1);
      print("result db : "+result.length.toString());*/

      var token = await PrefUtils().getPreferencesData(Utils().token);

      SliderModel sliderModel =
          await Webservice().requestSliderAndUserData(token.toString());

      if (!sliderModel.error!) {
        setState(() {
          userName = sliderModel.data!.userData!.name!;
          userBal = "₹ " + sliderModel.data!.userData!.wallet_balance!;
          _list = sliderModel.data!.list!;
        });

       PrefUtils().savePreferencesData(Utils().user_name,userName);
      }

      print('response : ${jsonEncode(sliderModel)}');
    } catch (e) {
      Utils().showMsg(context,e.toString());
    }
  }

  Future<void> getPopularLeads() async {
    try {
      if (mounted) ProgressDialogUtils().progressDialogue(context);

      var token = await PrefUtils().getPreferencesData("token");

      LeadModel leadModel =
          await Webservice().requestPopularLeadsList(token.toString());

      if (!leadModel.error!) {
        setState(() {
          _popularLeadList = leadModel.data!.list!;
        });
      }

      if (mounted) ProgressDialogUtils().hideProgressDialog(context, mounted);
      print('response : ${jsonEncode(leadModel)}');
    } catch (e) {
      if (mounted) ProgressDialogUtils().hideProgressDialog(context, mounted);
      Utils().showMsg(context,e.toString());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    //if (state == AppLifecycleState.resumed) {
    setState(() {
      updateMenuName();
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
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
                                  20.00,
                                ),
                                bottom: getVerticalSize(
                                  20.00,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          6.00,
                                        ),
                                        bottom: getVerticalSize(
                                          6.00,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          16.00,
                                        ),
                                        width: getHorizontalSize(
                                          24.00,
                                        ),
                                        child: SvgPicture.asset(
                                          ImageConstant.imgHamburger,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 30),
                                          child: InkWell(
                                            onTap: () {
                                              showCustomDialog(context);
                                            },
                                            child: Icon(
                                              Icons.power_settings_new,
                                              size: 20,
                                              color: ColorConstant.whiteA700,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ImageConstant.imgLogo,
                                          height: getVerticalSize(
                                            28.00,
                                          ),
                                          width: getHorizontalSize(
                                            103.00,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return ChangeLanguageScreen();
                                                    })
                                                .then((value) =>
                                                    updateMenuName());
                                          },
                                          child: Container(
                                            height: getVerticalSize(
                                              27.00,
                                            ),
                                            width: getHorizontalSize(
                                              95.00,
                                            ),
                                            margin: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                10.00,
                                              ),
                                              top: getVerticalSize(
                                                3.00,
                                              ),
                                              bottom: getVerticalSize(
                                                3.00,
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                        4.00,
                                                      ),
                                                      top: getVerticalSize(
                                                        3.00,
                                                      ),
                                                      right: getHorizontalSize(
                                                        10.00,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        3.00,
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
                                                        ImageConstant.imgGlobe,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(
                                                          16.00,
                                                        ),
                                                      ),
                                                      border: Border.all(
                                                        color: ColorConstant
                                                            .deepOrange200,
                                                        width:
                                                            getHorizontalSize(
                                                          1.00,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 58,
                                                          margin:
                                                              EdgeInsets.only(
                                                            left:
                                                                getHorizontalSize(
                                                              10.00,
                                                            ),
                                                            top:
                                                                getVerticalSize(
                                                              5.00,
                                                            ),
                                                            bottom:
                                                                getVerticalSize(
                                                              5.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            Languages.of(
                                                                    context)!
                                                                .lngName,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylerobotoromanbold141
                                                                .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                14,
                                                              ),
                                                              height: 1.14,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              getVerticalSize(
                                                            5,
                                                          ),
                                                          width:
                                                              getHorizontalSize(
                                                            10,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                            left:
                                                                getHorizontalSize(
                                                              1,
                                                            ),
                                                            top:
                                                                getVerticalSize(
                                                              8.00,
                                                            ),
                                                            right:
                                                                getHorizontalSize(
                                                              4,
                                                            ),
                                                            bottom:
                                                                getVerticalSize(
                                                              8,
                                                            ),
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            ImageConstant
                                                                .imgArrowDownWhite,
                                                            fit: BoxFit.fill,
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
                                            left: getHorizontalSize(
                                              10.00,
                                            ),
                                            bottom: getVerticalSize(
                                              3.00,
                                            ),
                                          ),
                                          child: Container(
                                            height: getVerticalSize(
                                              25.00,
                                            ),
                                            width: getHorizontalSize(
                                              34.00,
                                            ),
                                            child: SvgPicture.asset(
                                              ImageConstant.imgVideo,
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
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            22.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  21.00,
                                ),
                                right: getHorizontalSize(
                                  15.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.black901,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    getHorizontalSize(
                                      0.00,
                                    ),
                                  ),
                                  topRight: Radius.circular(
                                    getHorizontalSize(
                                      9.00,
                                    ),
                                  ),
                                  bottomLeft: Radius.circular(
                                    getHorizontalSize(
                                      0.00,
                                    ),
                                  ),
                                  bottomRight: Radius.circular(
                                    getHorizontalSize(
                                      0.00,
                                    ),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        14.00,
                                      ),
                                      top: getVerticalSize(
                                        23.00,
                                      ),
                                      bottom: getVerticalSize(
                                        22.00,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: getHorizontalSize(
                                              7.00,
                                            ),
                                          ),
                                          child: Text(
                                            Languages.of(context)!.labelHello +
                                                userName,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppStyle
                                                .textstylerobotoromanbold201
                                                .copyWith(
                                              fontSize: getFontSize(
                                                20,
                                              ),
                                              height: 0.80,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: getVerticalSize(
                                              21.00,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: getVerticalSize(
                                                    1.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  Languages.of(context)!
                                                      .labelBal,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .textstylerobotoromanregular141
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    letterSpacing: 1.82,
                                                    height: 0.93,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: getHorizontalSize(
                                                    13.00,
                                                  ),
                                                  bottom: getVerticalSize(
                                                    1.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  userBal,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .textstylerobotoromanregular18
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      18,
                                                    ),
                                                    letterSpacing: 2.34,
                                                    height: 0.72,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: getVerticalSize(
                                      75.00,
                                    ),
                                    width: getHorizontalSize(
                                      93.00,
                                    ),
                                    margin: EdgeInsets.only(
                                      bottom: getVerticalSize(
                                        21.00,
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                10.00,
                                              ),
                                              bottom: getVerticalSize(
                                                10.00,
                                              ),
                                            ),
                                            child: Container(
                                              height: getVerticalSize(
                                                54.00,
                                              ),
                                              width: getHorizontalSize(
                                                55.00,
                                              ),
                                              child: SvgPicture.asset(
                                                ImageConstant.imgRectangle10,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                10.00,
                                              ),
                                              right: getHorizontalSize(
                                                10.00,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getSize(
                                                  25.00,
                                                ),
                                              ),
                                              child: Image.asset(
                                                ImageConstant.imgUser1,
                                                height: getSize(
                                                  52.00,
                                                ),
                                                width: getSize(
                                                  52.00,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  21.00,
                                ),
                                top: getVerticalSize(
                                  17.00,
                                ),
                                right: getHorizontalSize(
                                  16.00,
                                ),
                              ),
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: getVerticalSize(
                                    135.00,
                                  ),
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      silderIndex = index;
                                    });
                                  },
                                ),
                                itemCount: _list.length,
                                itemBuilder: (context, index, realIndex) {
                                  SliderImgList model = _list[index];
                                  return SliderItemWidget(
                                    model,
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                4.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  21.00,
                                ),
                                top: getVerticalSize(
                                  12.00,
                                ),
                                right: getHorizontalSize(
                                  21.00,
                                ),
                              ),
                              child: AnimatedSmoothIndicator(
                                activeIndex: silderIndex,
                                count: _list.length,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                  spacing: 5,
                                  activeDotColor: ColorConstant.yellow900,
                                  dotColor: ColorConstant.gray401,
                                  dotHeight: getVerticalSize(
                                    4.00,
                                  ),
                                  dotWidth: getHorizontalSize(
                                    4.00,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  16.00,
                                ),
                                top: getVerticalSize(
                                  17.00,
                                ),
                                right: getHorizontalSize(
                                  16.00,
                                ),
                              ),
                            //  color: ColorConstant.gray100,
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: getVerticalSize(
                                    131.00,
                                  ),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: getHorizontalSize(
                                    16.00,
                                  ),
                                  crossAxisSpacing: getHorizontalSize(
                                    16.00,
                                  ),
                                ),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: homeUiForContractorModelObj.length,
                                itemBuilder: (context, index) {
                                  HomeUiForContractorItemModel model =
                                      homeUiForContractorModelObj[index];
                                  return HomeUiForContractorItemWidget(
                                    index,
                                    model,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _popularLeadList.length,
                                itemBuilder: (context, index) {
                                  LeadList model = _popularLeadList[index];
                                  return LeadsItemWidget(
                                    model,
                                  );
                                },
                              ),
                            ),
                            /*Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  21.00,
                                ),
                                top: getVerticalSize(
                                  21.00,
                                ),
                                right: getHorizontalSize(
                                  16.00,
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
                                      2,
                                      2,
                                    ),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        8.00,
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
                                              5.00,
                                            ),
                                            top: getVerticalSize(
                                              3.00,
                                            ),
                                            bottom: getVerticalSize(
                                              3.00,
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: getSize(
                                                  24.00,
                                                ),
                                                width: getSize(
                                                  24.00,
                                                ),
                                                child: SvgPicture.asset(
                                                  ImageConstant.imgCalendar,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: getHorizontalSize(
                                                    4.00,
                                                  ),
                                                  top: getVerticalSize(
                                                    2.00,
                                                  ),
                                                  bottom: getVerticalSize(
                                                    2.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  "27 Jun, 2022",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstylerobotoromanregular8
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    height: 1.25,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: getHorizontalSize(
                                                    11.00,
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
                                                    ImageConstant.imgTime,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: getHorizontalSize(
                                                    4.00,
                                                  ),
                                                  top: getVerticalSize(
                                                    2.00,
                                                  ),
                                                  bottom: getVerticalSize(
                                                    2.00,
                                                  ),
                                                ),
                                                child: Text(
                                                  "10:30 AM",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstylerobotoromanregular8
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    height: 1.25,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: getHorizontalSize(
                                              5.00,
                                            ),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: getVerticalSize(
                                              20.00,
                                            ),
                                            width: 140,
                                            decoration: AppDecoration
                                                .textstylerobotoromanregular101,
                                            child: Text(
                                              "Flooring Tiles Work-Floor",
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .textstylerobotoromanregular101
                                                  .copyWith(
                                                fontSize: getFontSize(
                                                  14,
                                                ),
                                                height: 1.20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      400.00,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        5.00,
                                      ),
                                      top: getVerticalSize(
                                        9.00,
                                      ),
                                      right: getHorizontalSize(
                                        5.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Contrary to popular belief, Lorem Ipsum is not simply random",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotobold12
                                          .copyWith(
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        7.00,
                                      ),
                                      bottom: getVerticalSize(
                                        4.00,
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
                                            left: getHorizontalSize(
                                              5.00,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    130,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: getVerticalSize(
                                                        22.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        120.00,
                                                      ),
                                                      decoration: AppDecoration
                                                          .textstylerobotoromanregular81,
                                                      child: Text(
                                                        "Budget  Rs 40, 000",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstylerobotoromanregular81
                                                            .copyWith(
                                                          fontSize: getFontSize(
                                                            14,
                                                          ),
                                                          height: 1.50,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: getVerticalSize(
                                                        22.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        140.00,
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            unitAreasqfController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              "Unit: Area sq.ft / Qty: 9000",
                                                          hintStyle: AppStyle
                                                              .textstylerobotoromanregular82
                                                              .copyWith(
                                                            fontSize:
                                                                getFontSize(
                                                              13.0,
                                                            ),
                                                            color: ColorConstant
                                                                .black900,
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              getHorizontalSize(
                                                                20.00,
                                                              ),
                                                            ),
                                                            borderSide:
                                                                BorderSide.none,
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              ColorConstant
                                                                  .lightBlue50,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                            left:
                                                                getHorizontalSize(
                                                              7.00,
                                                            ),
                                                            top:
                                                                getVerticalSize(
                                                              5.00,
                                                            ),
                                                            bottom:
                                                                getVerticalSize(
                                                              5.00,
                                                            ),
                                                          ),
                                                        ),
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize: getFontSize(
                                                            8.0,
                                                          ),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: getVerticalSize(
                                                    8.00,
                                                  ),
                                                  bottom: getHorizontalSize(
                                                    10.00,
                                                  ),
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: getVerticalSize(
                                                    22.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    120.00,
                                                  ),
                                                  decoration: AppDecoration
                                                      .textstylerobotoromanregular83,
                                                  child: Text(
                                                    "Duration : 2Month",
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstylerobotoromanregular83
                                                        .copyWith(
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      height: 1.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: getVerticalSize(
                                              5.00,
                                            ),
                                            right: getHorizontalSize(
                                              25.00,
                                            ),
                                            bottom: getVerticalSize(
                                              8.00,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: getHorizontalSize(
                                                    10.00,
                                                  ),
                                                  top: 10,
                                                ),
                                                child: Text(
                                                  "Price:",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstylerobotoromanregular84
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    height: 1.50,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Rs. 4000",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanbold121
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    12,
                                                  ),
                                                  height: 1.42,
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
                            ),*/
                           /* InkWell(
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    21.00,
                                  ),
                                  top: getVerticalSize(
                                    21.00,
                                  ),
                                  right: getHorizontalSize(
                                    16.00,
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
                                        2,
                                        2,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          8.00,
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
                                                5.00,
                                              ),
                                              top: getVerticalSize(
                                                3.00,
                                              ),
                                              bottom: getVerticalSize(
                                                3.00,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: getSize(
                                                    24.00,
                                                  ),
                                                  width: getSize(
                                                    24.00,
                                                  ),
                                                  child: SvgPicture.asset(
                                                    ImageConstant.imgCalendar,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      4.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      2.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      2.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "27 Jun, 2022",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstylerobotoromanregular8
                                                        .copyWith(
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      height: 1.25,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      11.00,
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
                                                      ImageConstant.imgTime,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      4.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      2.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      2.00,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "10:30 AM",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstylerobotoromanregular8
                                                        .copyWith(
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      height: 1.25,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: getHorizontalSize(
                                                5.00,
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: getVerticalSize(
                                                20.00,
                                              ),
                                              width: 140,
                                              decoration: AppDecoration
                                                  .textstylerobotoromanregular101,
                                              child: Text(
                                                "Flooring Tiles Work-Floor",
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textstylerobotoromanregular101
                                                    .copyWith(
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  height: 1.20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getHorizontalSize(
                                        400.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          5.00,
                                        ),
                                        top: getVerticalSize(
                                          9.00,
                                        ),
                                        right: getHorizontalSize(
                                          5.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Contrary to popular belief, Lorem Ipsum is not simply random",
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textstylerobotobold12
                                            .copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 1.25,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          7.00,
                                        ),
                                        bottom: getVerticalSize(
                                          4.00,
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
                                              left: getHorizontalSize(
                                                5.00,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      130,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                          22.00,
                                                        ),
                                                        width:
                                                            getHorizontalSize(
                                                          120.00,
                                                        ),
                                                        decoration: AppDecoration
                                                            .textstylerobotoromanregular81,
                                                        child: Text(
                                                          "Budget  Rs 40, 000",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .textstylerobotoromanregular81
                                                              .copyWith(
                                                            fontSize:
                                                                getFontSize(
                                                              14,
                                                            ),
                                                            height: 1.50,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: getVerticalSize(
                                                          22.00,
                                                        ),
                                                        width:
                                                            getHorizontalSize(
                                                          140.00,
                                                        ),
                                                        child: TextFormField(
                                                          controller:
                                                              unitAreasqfController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Unit: Area sq.ft / Qty: 9000",
                                                            hintStyle: AppStyle
                                                                .textstylerobotoromanregular82
                                                                .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                13.0,
                                                              ),
                                                              color:
                                                                  ColorConstant
                                                                      .black900,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  20.00,
                                                                ),
                                                              ),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                ColorConstant
                                                                    .lightBlue50,
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                              left:
                                                                  getHorizontalSize(
                                                                7.00,
                                                              ),
                                                              top:
                                                                  getVerticalSize(
                                                                5.00,
                                                              ),
                                                              bottom:
                                                                  getVerticalSize(
                                                                5.00,
                                                              ),
                                                            ),
                                                          ),
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                                getFontSize(
                                                              8.0,
                                                            ),
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: getVerticalSize(
                                                      8.00,
                                                    ),
                                                    bottom: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: getVerticalSize(
                                                      22.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      120.00,
                                                    ),
                                                    decoration: AppDecoration
                                                        .textstylerobotoromanregular83,
                                                    child: Text(
                                                      "Duration : 2Month",
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstylerobotoromanregular83
                                                          .copyWith(
                                                        fontSize: getFontSize(
                                                          14,
                                                        ),
                                                        height: 1.50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: getVerticalSize(
                                                5.00,
                                              ),
                                              right: getHorizontalSize(
                                                25.00,
                                              ),
                                              bottom: getVerticalSize(
                                                8.00,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: getHorizontalSize(
                                                      10.00,
                                                    ),
                                                    top: 10,
                                                  ),
                                                  child: Text(
                                                    "Price:",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstylerobotoromanregular84
                                                        .copyWith(
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      height: 1.50,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Rs. 4000",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstylerobotoromanbold121
                                                      .copyWith(
                                                    fontSize: getFontSize(
                                                      12,
                                                    ),
                                                    height: 1.42,
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OngoingProjectTabPage()));
                              },
                            ),*/
                            /*Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  top: getVerticalSize(
                                    10.00,
                                  ),
                                ),
                                child: Container(
                                  height: getSize(
                                    66.00,
                                  ),
                                  width: getSize(
                                    66.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgPdf,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        14.52,
                      ),
                      bottom: getVerticalSize(
                        14.52,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                2.00,
                              ),
                              right: getHorizontalSize(
                                1.00,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                26.62,
                              ),
                              width: getHorizontalSize(
                                22.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgMenu,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              4,
                            ),
                          ),
                          child: Text(
                            Languages.of(context)!.homeMenu,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoregular10.copyWith(
                              fontSize: getFontSize(
                                12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        14.52,
                      ),
                      bottom: getVerticalSize(
                        14.52,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              6.00,
                            ),
                            right: getHorizontalSize(
                              4.00,
                            ),
                          ),
                          child: Container(
                            height: getVerticalSize(
                              26.62,
                            ),
                            width: getHorizontalSize(
                              22.00,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgSearchdocument,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                4,
                              ),
                            ),
                            child: Text(
                              Languages.of(context)!.homeEnquiry,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoregular10.copyWith(
                                fontSize: getFontSize(
                                  12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        14.52,
                      ),
                      bottom: getVerticalSize(
                        14.22,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                4.00,
                              ),
                              right: getHorizontalSize(
                                4.00,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                27.23,
                              ),
                              width: getHorizontalSize(
                                24.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgPlay,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              4,
                            ),
                          ),
                          child: Text(
                            Languages.of(context)!.homeTutorial,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoregular10.copyWith(
                              fontSize: getFontSize(
                                12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        13.31,
                      ),
                      bottom: getVerticalSize(
                        13.31,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              16.00,
                            ),
                            right: getHorizontalSize(
                              16.00,
                            ),
                          ),
                          child: Container(
                            height: getVerticalSize(
                              31.46,
                            ),
                            width: getHorizontalSize(
                              21.67,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgBell,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                4,
                              ),
                            ),
                            child: Text(
                              Languages.of(context)!.homeNotification,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoregular10.copyWith(
                                fontSize: getFontSize(
                                  10,
                                ),
                              ),
                            ),
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
    );
  }

  void updateMenuName() {
    Timer(
        Duration(seconds: 0),
        () => {
              homeUiForContractorModelObj = [
                HomeUiForContractorItemModel(
                    ImageConstant.imgLeads, Languages.of(context)!.homeJob),
                HomeUiForContractorItemModel(ImageConstant.imgProject,
                    Languages.of(context)!.homeProject),
                HomeUiForContractorItemModel(ImageConstant.imgQuotation,
                    Languages.of(context)!.homeQuotation),
                HomeUiForContractorItemModel(ImageConstant.imgInvoice,
                    Languages.of(context)!.homeInvoice),
                HomeUiForContractorItemModel(ImageConstant.imgLabour1,
                    Languages.of(context)!.homeLabour),
                HomeUiForContractorItemModel(ImageConstant.imgMaterial,
                    Languages.of(context)!.homeMaterial),
                HomeUiForContractorItemModel(
                    ImageConstant.imgClient, Languages.of(context)!.homeClient),
                HomeUiForContractorItemModel(
                    ImageConstant.imgLegal, Languages.of(context)!.homeLegal),
                HomeUiForContractorItemModel(ImageConstant.imgAccount,
                    Languages.of(context)!.homeAccount),
              ]
            });
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.width/2.4,
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Logout!',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    'Would you like to confirm logout?',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width/10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            print('Confirmed');
                            logout();
                          },
                        ),
                        TextButton(
                          child:
                              Text('No', style: TextStyle(color: Colors.green)),
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

  void logout() {
    PrefUtils().clearPreferencesAllData();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }
}
