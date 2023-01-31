import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:thikdr/ui/home/home.dart';
import 'package:thikdr/utils/color_constant.dart';
import 'package:thikdr/utils/image_constant.dart';

import '../../network/webservice.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/dialog/dialog_page.dart';
import '../../utils/math_utils.dart';

class DataNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset(
              ImageConstant.imgBoxEmpty,
              fit: BoxFit.contain,
            ),
          ),
          Container(
              padding: EdgeInsets.only(
              //  left: 10,
              ),
              child:
              Text(
                "Data not found!",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style:
                AppStyle.textstylerobotoromanbold161.copyWith(
                  fontSize: getFontSize(
                    18,
                  ),
                  height: 1.00,
                  color: Colors.deepOrange
                ),
              ),
            ),
        ],
      );
  }

}
