import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../../../leaddetails/model/lead_details_model.dart';
import '../../../leaddetails/model/lead_model.dart';
import '../../../leaddetails/my_leads_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' show Platform;

// ignore: must_be_immutable
class MyLeadsItemWidget extends StatelessWidget {
  MyLeadsItemWidget(this.myLeadsModel);

  LeadList myLeadsModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      // MyLeadDetailsPage(myLeadsModel))
                      MyLeadDetailsPage(myLeadsModel.id.toString())));
        },
        child:
            /* Container(
        margin: EdgeInsets.only(
          top: getVerticalSize(
            10.00,
          ),
          bottom: getVerticalSize(
            10.00,
          ),
          right: 2
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
        child:*/
            Card(
          elevation: 6,
          shadowColor: Colors.grey,
          color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          0,
                        ),
                        top: getVerticalSize(
                          3.00,
                        ),
                        bottom: getVerticalSize(
                          3.00,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                ImageConstant.imgCalendar,
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
                              "Estmd start date : " + myLeadsModel.esd,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.textstylerobotoromanregular8
                                  .copyWith(
                                fontSize: getFontSize(
                                  12,
                                ),
                                height: 1.25,
                              ),
                            ),
                          ),
                          /*Padding(
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
                          leadModel.lead_time.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanregular8.copyWith(
                            fontSize: getFontSize(
                              12,
                            ),
                            height: 1.25,
                          ),
                        ),
                      ),*/
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          22.00,
                        ),
                        decoration:
                            AppDecoration.textstylerobotoromanregular1013,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(18),
                              right: getHorizontalSize(18)),
                          child: Text(
                            myLeadsModel.lead_status.toString(),
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanregular1013
                                .copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    12.00,
                  ),
                  top: getVerticalSize(
                    10.00,
                  ),
                  bottom: getVerticalSize(
                    6.00,
                  ),
                ),
                child: Text(
                  myLeadsModel.type.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotobold12.copyWith(
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
                    12.00,
                  ),
                  top: getVerticalSize(
                    9.00,
                  ),
                  right: getHorizontalSize(
                    12.00,
                  ),
                ),
                child: Text(
                  myLeadsModel.user.toString() +
                      "\n" +
                      myLeadsModel.address.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular8.copyWith(
                    fontSize: getFontSize(
                      14,
                    ),
                    height: 1.25,
                  ),
                ),
              ),
              /*Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  4.00,
                ),
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        11.00,
                      ),
                      bottom: getVerticalSize(
                        1.00,
                      ),
                    ),
                    child: Text(
                        ((myLeadsModel!=null) && (myLeadsModel.description!=null))?
                      (myLeadsModel.description.toString().length>80?
                      myLeadsModel.description.toString().substring(0,80)+"...":
                      myLeadsModel.description.toString()):"",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstylerobotoromanregular104.copyWith(
                        fontSize: getFontSize(
                          14,
                        ),
                        height: 1.70,
                      ),
                    ),
                  ),
                  ),

              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        1.00,
                      ),
                      right: getHorizontalSize(
                        10.00,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: getHorizontalSize(
                              1.00,
                            ),
                          ),
                          child: Text(
                            "₹ "+myLeadsModel.price_range.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style:
                                AppStyle.textstylerobotoromanbold121.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.42,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              2.00,
                            ),
                          ),
                          child: Text(
                            "Estmd, Order Value".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: AppStyle.textstylerobotoromanregular103
                                .copyWith(
                              fontSize: getFontSize(
                                12,
                              ),
                              height: 1.70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ),*/
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    4.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            11.00,
                          ),
                          bottom: getVerticalSize(
                            1.00,
                          ),
                        ),
                        child: Text(
                          ((myLeadsModel != null) &&
                                  (myLeadsModel.description != null))
                              ? (myLeadsModel.description.toString().length > 80
                                  ? myLeadsModel.description
                                          .toString()
                                          .substring(0, 80) +
                                      "..."
                                  : myLeadsModel.description.toString())
                              : "",
                          //"Guntur, Andhra Pradesh, India \n08 April, 2022".tr,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular104.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
                            height: 1.70,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            1.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
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
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "₹ " + myLeadsModel.price_range.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanbold121
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.42,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Estmd, Order Value".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppStyle.textstylerobotoromanregular103
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.70,
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
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          11.00,
                        ),
                        top: getVerticalSize(
                          6.00,
                        ),
                        bottom: getVerticalSize(
                          2.00,
                        ),
                      ),
                      child: Text(
                        "Job Type : " + myLeadsModel.job_type.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular8.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          7.00,
                        ),
                        right: getHorizontalSize(
                          8.00,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          22.00,
                        ),
                        decoration: AppDecoration.textstylerobotoromanregular83,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              8.00,
                            ),
                            right: getHorizontalSize(
                              8.00,
                            ),
                            bottom: getVerticalSize(
                              4.00,
                            ),
                          ),
                          child: Text(
                            "Duration : " + myLeadsModel.duration.toString(),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.textstylerobotoromanregular83.copyWith(
                              fontSize: getFontSize(
                                12,
                              ),
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(
                  1.00,
                ),
                width: getHorizontalSize(
                  MediaQuery.of(context).size.width,
                ),
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    14.00,
                  ),
                  top: getVerticalSize(
                    17.00,
                  ),
                  right: getHorizontalSize(
                    5.00,
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray302,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    17.00,
                  ),
                  bottom: getVerticalSize(
                    15.00,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        _makePhoneCall(myLeadsModel.phone);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: getHorizontalSize(
                            20.00,
                          ),
                          right: getHorizontalSize(
                            0.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              5.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.red200,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  15.00,
                                ),
                                top: getVerticalSize(
                                  12.00,
                                ),
                                bottom: getVerticalSize(
                                  2.00,
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
                                  ImageConstant.imgPhoneCall,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  15.00,
                                ),
                                top: getVerticalSize(
                                  6.00,
                                ),
                                right: getHorizontalSize(
                                  22.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "Call".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular1018
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      //+919007091555
                      onTap: () => {_whatsapp(context, myLeadsModel.phone)},
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              5.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.green500,
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
                                  10.00,
                                ),
                                top: getVerticalSize(
                                  5.00,
                                ),
                                bottom: getVerticalSize(
                                  5.00,
                                ),
                              ),
                              child: Container(
                                height: getSize(
                                  14.00,
                                ),
                                width: getSize(
                                  14.00,
                                ),
                                child: SvgPicture.asset(
                                  ImageConstant.imgWhatsAppGreen,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  5.00,
                                ),
                                top: getVerticalSize(
                                  5.00,
                                ),
                                right: getHorizontalSize(
                                  10.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "Whatsapp".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular1019
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  height: 1.70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        margin: EdgeInsets.only(
                          right: getHorizontalSize(
                            20.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              5.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.bluegray101,
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
                                  9.00,
                                ),
                                top: getVerticalSize(
                                  10.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "Lead Status".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.textstylerobotoromanregular1020
                                    .copyWith(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  10.00,
                                ),
                                top: getVerticalSize(
                                  10.00,
                                ),
                                right: getHorizontalSize(
                                  10.00,
                                ),
                                bottom: getVerticalSize(
                                  10.00,
                                ),
                              ),
                              child: Container(
                                height: getVerticalSize(
                                  6.00,
                                ),
                                width: getHorizontalSize(
                                  8.00,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri,
      mode: LaunchMode.externalApplication
    );
  }

  Future<void> _whatsapp(BuildContext context, String contact) async {
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('WhatsApp is not installed.'),
      ));
    }
  }
}
