
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikdr/ui/projectsummary/workertab/staff/payment/payment_page.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/math_utils.dart';

class AllowanceDialog extends StatelessWidget {

  int radioGroup = 1;
  int radioGroup1 = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child:Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorConstant.gray102,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: ColorConstant.redA400,
                      value: 1,
                      groupValue: radioGroup,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Allowance",
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.textstylerobotoromanregular13.copyWith(
                        fontSize: getFontSize(
                          14,
                        ),
                        height: 1.23,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: radioGroup1,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Deduction",
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.textstylerobotoromanregular13.copyWith(
                        fontSize: getFontSize(
                          14,
                        ),
                        height: 1.23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: getHorizontalSize(
                    136.00,
                  ),
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      14.00,
                    ),
                    bottom: getVerticalSize(
                      14.00,
                    ),
                  ),
                  decoration: AppDecoration.textstylerobotoromanbold163,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Description*",
                          style: TextStyle(
                            color: ColorConstant.gray501,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.00,
                          ),
                        ),
                        TextSpan(
                          text: "",
                          style: TextStyle(
                            color: ColorConstant.gray501,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            height: 1.00,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    136.00,
                  ),
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      16.00,
                    ),
                    top: getVerticalSize(
                      14.00,
                    ),
                    bottom: getVerticalSize(
                      14.00,
                    ),
                  ),
                  decoration: AppDecoration.textstylerobotoromanbold163,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Amount*",
                          style: TextStyle(
                            color: ColorConstant.gray501,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.00,
                          ),
                        ),
                        TextSpan(
                          text: "",
                          style: TextStyle(
                            color: ColorConstant.gray501,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            height: 1.00,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WorkerNamePage()));
              },child:
              Container(
                margin: EdgeInsets.only(top: getVerticalSize(20)),
                alignment: Alignment.center,
                height: getVerticalSize(
                  45.00,
                ),
                width: getHorizontalSize(
                  349.00,
                ),
                decoration: AppDecoration.textstylerobotoromanbold13,
                child: Text(
                  "Add",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanbold13.copyWith(
                    fontSize: getFontSize(
                      13,
                    ),
                  ),
                ),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
