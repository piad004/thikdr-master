import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import 'package:http/http.dart' as http;

class EstimatePDFPage extends StatefulWidget {
  @override
  State<EstimatePDFPage> createState() => _EstimatePDFState();
}

class _EstimatePDFState extends State<EstimatePDFPage> {
  @override
  Widget build(BuildContext context) {
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
              "Preview".toUpperCase(),
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
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
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
                        18.00,
                      ),
                      bottom: getVerticalSize(
                        14.00,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        right: getHorizontalSize(
                          118.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgVector78,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                77.00,
                              ),
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                1.00,
                              ),
                            ),
                            child: Text(
                              "msg_estimate_deatil".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                              AppStyle.textstylerobotobold20.copyWith(
                                fontSize: getFontSize(
                                  20,
                                ),
                                height: 0.80,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        19.00,
                      ),
                      bottom: getVerticalSize(
                        20.00,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          4.19,
                        ),
                        right: getHorizontalSize(
                          2.20,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImageConstant.imgEstimateDetails,
                              height: getVerticalSize(
                                  MediaQuery.of(context).size.height - 200),
                              /*width: getHorizontalSize(
                          407.61,
                        ),*/
                              fit: BoxFit.fill,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstimatePage()));*/
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  15.00,
                                ),
                                top: getVerticalSize(
                                  50.00,
                                ),
                                right: getHorizontalSize(
                                  12.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5.00,
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
                                    ColorConstant.whiteA700,
                                    ColorConstant.whiteA700,
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: ()=>{
                                      shareEstimate()
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          10.00,
                                        ),
                                        top: getVerticalSize(
                                          18.00,
                                        ),
                                        bottom: getVerticalSize(
                                          19.00,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            5.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            40.00,
                                          ),
                                          width: getSize(
                                            40.00,
                                          ),
                                          child: Image.asset(
                                            ImageConstant.imgShare1,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 /* Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        3.00,
                                      ),
                                      top: getVerticalSize(
                                        15.00,
                                      ),
                                      right: getHorizontalSize(
                                        140.00,
                                      ),
                                      bottom: getVerticalSize(
                                        15.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Add Estimate".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylerobotoromanbold131
                                          .copyWith(
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  shareEstimate() async {

    final ByteData bytes = await rootBundle
        .load(ImageConstant.imgEstimateDetails);
    final Uint8List list = bytes.buffer.asUint8List();
    final directory = (await getExternalStorageDirectory())?.path;
    File imgFile = File('$directory/screenshot.png');
    imgFile.writeAsBytesSync(list);

    Share.shareFiles(['$directory/screenshot.png'],
        /*sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size*/);
  }

}
