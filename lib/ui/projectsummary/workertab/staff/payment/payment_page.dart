
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikdr/ui/projectsummary/payment/models/payment_item_model.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker/widgets/digger_item_widget.dart';

import '../../../../../theme/app_decoration.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/math_utils.dart';
import '../../../payment/widgets/payment_item_widget.dart';
import '../../worker/models/worker_item_model.dart';

class WorkerNamePage extends StatefulWidget {
  @override
  State<WorkerNamePage> createState() => _WorkerNameState();
}

class _WorkerNameState extends State<WorkerNamePage> {

  List<PaymentItemModel> _list=[
    PaymentItemModel(''),
    PaymentItemModel(''),
    PaymentItemModel(''),
    PaymentItemModel(''),
  ];
  List<WorkerItemModel> _list1=[
    WorkerItemModel(''),
    WorkerItemModel(''),
    WorkerItemModel(''),
    WorkerItemModel(''),
  ];

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
            title:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Worker Name".toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.textstylerobotobold20.copyWith(
                    fontSize: getFontSize(
                      20,
                    ),
                    height: 0.80,
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 15,right: 15,
                      top:6,bottom: 6),
                  margin: EdgeInsets.only(right: 8),
                  decoration: AppDecoration.textstylerobotoromanextrabold12.copyWith(
                    border: Border.all(color: ColorConstant.whiteA700),
                      borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                      color:  Colors.transparent
                  ),
                  child: Text(
                    "Pay",
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanextrabold12.copyWith(
                      fontSize: getFontSize(
                        14,
                      ),
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: ColorConstant.whiteA700,
          bottomSheet:  Container(
           // alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: 10,right: 20,left: 20
            ),
            child:
            Container(
              alignment: Alignment.center,
              height: 45,
              //width:300,
              decoration: AppDecoration.textstylerobotoromanbold13,
              child: Text(
                "Save",
                textAlign: TextAlign.left,
                style: AppStyle.textstylerobotoromanbold13.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          body: Container(
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    //height: 50,
                    width: size.width,
                    child: Stack(
                    //  alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: getHorizontalSize(
                            double.infinity,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                0.00,
                              ),
                            ),
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
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(left: 8,right: 8,
                              top:5,bottom: 5),
                          margin: EdgeInsets.only(top:10,left: 80,right: 80),
                          decoration: AppDecoration.textstylerobotoromanextrabold12,
                          child: Text(
                            "IN 400 per day  |  6 hrs per shift",
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanextrabold12.copyWith(
                              fontSize: getFontSize(
                                14,
                              ),
                              height: 1.00,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 40,
                            right: 5,
                            left: 5,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5.00,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.gray5005e,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    75.00,
                                  ),
                                  top: getVerticalSize(
                                    22.00,
                                  ),
                                  bottom: getVerticalSize(
                                    19.00,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Total Salary",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.textstylerobotoromanbold14
                                                .copyWith(
                                              fontSize: getFontSize(
                                                14,
                                              ),
                                              height: 1.14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              33.00,
                                            ),
                                            top: getVerticalSize(
                                              6.00,
                                            ),
                                            right: getHorizontalSize(
                                              33.00,
                                            ),
                                          ),
                                          child: Text(
                                            "7",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.textstylerobotoromanbold14
                                                .copyWith(
                                              fontSize: getFontSize(
                                                14,
                                              ),
                                              height: 1.14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: getVerticalSize(
                                        34.00,
                                      ),
                                      width: getHorizontalSize(
                                        1.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          39.00,
                                        ),
                                        bottom: getVerticalSize(
                                          4.00,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    65.00,
                                  ),
                                  top: getVerticalSize(
                                    20.00,
                                  ),
                                  right: getHorizontalSize(
                                    50.00,
                                  ),
                                  bottom: getVerticalSize(
                                    21.00,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          1.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Balance",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                        AppStyle.textstylerobotoromanbold143.copyWith(
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          height: 1.14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          6.00,
                                        ),
                                      ),
                                      child: Text(
                                        "IN 4,350",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                        AppStyle.textstylerobotoromanbold143.copyWith(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top:15,
                  ),
                  child:  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        PaymentItemModel model = _list[index];
                        WorkerItemModel model1 = _list1[index];
                        return DiggerItemWidget(model1
                        );
                       /* PaymentItemWidget(
                          model,
                        );*/
                      },
                  ),
                ),
              ],
            ),
          ),

        ));
  }
}
