import '../../../../theme/app_decoration.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import '../models/payment_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentItemWidget extends StatelessWidget {
  PaymentItemWidget(this.paymentItemModelObj);

  PaymentItemModel paymentItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1,color: Colors.black38,),
        Container(
          margin: EdgeInsets.only(
            top: getVerticalSize(
              0.50,
            ),
            bottom: getVerticalSize(
              0.50,
            ),
          ),
          decoration: BoxDecoration(
            color: ColorConstant.gray102,
          ),
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
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
                    6.00,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(3),top: getVerticalSize(3)),
                      decoration: BoxDecoration(
                        color: ColorConstant.lightBlue50,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "27 Dec from Sample user 1",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular102.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          2.00,
                        ),
                        top: getVerticalSize(
                          7.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "Sample-Food for site...",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold122.copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 1.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          2.00,
                        ),
                        top: getVerticalSize(
                          6.00,
                        ),
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          getSize(
                            12.00,
                          ),
                        ),
                        child: Image.asset(
                          ImageConstant.imgUser1,
                          height: getSize(
                            24.00,
                          ),
                          width: getSize(
                            24.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    15.00,
                  ),
                  top: getVerticalSize(
                    27.00,
                  ),
                  right: getHorizontalSize(
                    9.00,
                  ),
                  bottom: getVerticalSize(
                    27.00,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Food and Travel",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular103.copyWith(
                          fontSize: getFontSize(
                            12,
                          ),
                          height: 1.20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          9.00,
                        ),
                        top: getVerticalSize(
                          2.00,
                        ),
                        right: getHorizontalSize(
                          8.00,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),bottom: getVerticalSize(5)),
                        decoration: AppDecoration.textstylerobotoromanregular85,
                        child: Text(
                          "Rs 20,000",
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylerobotoromanregular85.copyWith(
                            fontSize: getFontSize(
                              11,
                            ),
                            height: 1.50,
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
    );
  }
}
