import 'package:flutter/material.dart';
import 'package:thikdr/ui/estimate/estimate.dart';
import 'package:thikdr/ui/estimate/estimatedetails/estimate_details.dart';
import 'package:thikdr/ui/leads/leadstab/leads_tab.dart';
import 'package:thikdr/ui/materiallibrary/material_library_page.dart';
import 'package:thikdr/ui/projects/ongoing_projects_tab.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/math_utils.dart';
import '../../estimatequotation/estimate_quotation.dart';
import '../model/home_ui_for_contractor_item_model.dart';

// ignore: must_be_immutable
class HomeUiForContractorItemWidget extends StatelessWidget {
  HomeUiForContractorItemWidget(
      this.index, this.homeUiForContractorItemModelObj);

  HomeUiForContractorItemModel homeUiForContractorItemModelObj;
  int index;

  //var controller = Get.find<HomeUiForContractorController>();

  @override
  Widget build(BuildContext context) {
    return
        /*Container(
      */ /*clipBehavior: Clip.antiAlias,
      elevation: 1,
      margin: EdgeInsets.only(top: 2,left: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          1,
        ),
      ),*/ /*
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
       */ /* borderRadius: BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.whiteA700,
            spreadRadius: getHorizontalSize(
              1.00,
            ),
            blurRadius: getHorizontalSize(
              1.00,
            ),
            offset: Offset(
              0,
              2,
            ),
          ),
        ],*/ /*
      ),
      child:*/
        Card(
      elevation: 40,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LeadsTabPage()));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OngoingProjectTabPage()));
          } else if (index == 2) {
            /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EstimateQuotationPage()));*/
            /* Navigator.push(context,
                MaterialPageRoute(builder: (context) => EstimateDetailsPage()));*/
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EstimatePage()));
          } else if (index == 5) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MaterialLibraryPage()));
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getSize(
                60.00,
              ),
              width: getSize(
                60.00,
              ),
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  20.00,
                ),
                top: getVerticalSize(
                  10.00,
                ),
                right: getHorizontalSize(
                  20.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.orangeA100,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    29.50,
                  ),
                ),
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2,
                margin: EdgeInsets.all(0),
                color: ColorConstant.orangeA100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      29.50,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            9.00,
                          ),
                          top: getVerticalSize(
                            8.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child: Image.asset(
                          homeUiForContractorItemModelObj.icon,
                          // ImageConstant.imgWorker,
                          height: getSize(
                            40.00,
                          ),
                          width: getSize(
                            40.00,
                          ),
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
                  1.00,
                ),
                top: getVerticalSize(
                  10.00,
                ),
                right: getHorizontalSize(
                  1.00,
                ),
                bottom: getVerticalSize(
                  18.00,
                ),
              ),
              child: Text(
                homeUiForContractorItemModelObj.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyle.textstylerobotobold14.copyWith(
                  fontSize: getFontSize(
                    14,
                  ),
                  height: 1.14,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        //)
        ;
  }
}
