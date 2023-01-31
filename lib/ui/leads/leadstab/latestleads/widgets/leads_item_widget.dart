import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thikdr/ui/leads/leaddetails/lead_details.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../../../leaddetails/model/lead_model.dart';
import '../models/leads_item_model.dart';

// ignore: must_be_immutable
class LeadsItemWidget extends StatelessWidget {
  LeadsItemWidget(this.leadModel);

  LeadList leadModel;

  @override
  Widget build(BuildContext context) {
    return /*Container(
      margin: EdgeInsets.only(
        top: getVerticalSize(
          10.00,
        ),
        bottom: getVerticalSize(
          10.00,
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
      child:*/
      Card(
        elevation: 6,
        shadowColor: Colors.grey,
        color: Colors.white,
        child:
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LeadDetailsPage(leadModel.id.toString())));
        },
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Estmd start date : " + leadModel.esd.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.textstylerobotoromanregular8.copyWith(
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
                        20.00,
                      ),
                      decoration: AppDecoration.textstylerobotoromanregular1013,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          leadModel.lead_status.toString(),
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular1013.copyWith(
                            fontSize: getFontSize(
                              12,
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
                leadModel.type.toString(),
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
                      ((leadModel != null) && (leadModel.description != null))
                          ? (leadModel.description.toString().length > 80
                              ? leadModel.description
                                      .toString()
                                      .substring(0, 80) +
                                  "..."
                              : leadModel.description.toString())
                          : "",
                      //"Guntur, Andhra Pradesh, India \n08 April, 2022".tr,
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
                            "₹ " + leadModel.price_range.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.textstylerobotoromanbold121.copyWith(
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
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  11.00,
                ),
                top: getVerticalSize(
                  10.00,
                ),
                bottom: getVerticalSize(
                  2.00,
                ),
              ),
              child: Text(
                "Job Type : "+leadModel.job_type.toString(),
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
            Container(
              height: getVerticalSize(
                1.00,
              ),
              width: getHorizontalSize(
                MediaQuery.of(context).size.width,
              ),
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  17.00,
                ),
                top: getVerticalSize(
                  17.00,
                ),
                right: getHorizontalSize(
                  0.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.gray302,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                  left: 5
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  /* Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      6.00,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      22.00,
                    ),
                    decoration: AppDecoration.textstylerobotoromanregular812,
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
                        // "Unit: Area sq.ft / Qty: 9000".tr,
                        "Estmd start date :"+ leadModel.esd.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular812.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),*/
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
                          "Duration : " + leadModel.duration.toString(),
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
                  if(leadModel.buy_status!=null && leadModel.buy_status != 1)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LeadDetailsPage(leadModel.id.toString())));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          7.00,
                        ),
                        right: getHorizontalSize(
                          11.00,
                        ),
                        bottom: getVerticalSize(
                          7.00,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: getVerticalSize(
                          24.00,
                        ),
                        width: getHorizontalSize(
                          68.00,
                        ),
                        decoration:
                            AppDecoration.textstylerobotoromanregular1015,
                        child: Text(
                          "Buy Lead",
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.textstylerobotoromanregular1015.copyWith(
                            fontSize: getFontSize(
                              14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
            padding: EdgeInsets.only(
              top: getVerticalSize(
                11.00,
              ),
              bottom: getVerticalSize(
                15.00,
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
                      9.00,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      22.00,
                    ),
                    decoration: AppDecoration.textstylerobotoromanregular81,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(8),
                        right: getHorizontalSize(8),
                        bottom: getVerticalSize(
                          4.00,
                        ),
                      ),
                      child: Text(
                        "Budget ₹ "+ leadModel.budget.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular81.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      6.00,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(
                      22.00,
                    ),
                    decoration: AppDecoration.textstylerobotoromanregular812,
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
                       // "Unit: Area sq.ft / Qty: 9000".tr,
                        "Unit:"+ leadModel.unit.toString()+" / Qty:"+leadModel.qty.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular812.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.50,
                        ),
                      ),
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
                        "Duration : "+leadModel.duration.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular83.copyWith(
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
          ),*/
          ],
        ),
      ),
    );
  }
}
