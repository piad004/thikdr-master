import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../utils/image_constant.dart';

class DialogPage extends StatelessWidget {
  DialogPage(this.msg);

  var msg;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Alert Message",
                  textAlign: TextAlign.left,
                  style: AppStyle.textstylerobotoromanregular13.copyWith(
                    fontSize: 18,
                    height: 1.23,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:
                Container(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    ImageConstant.imgCloseIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child:
            Align(
              alignment: Alignment.center,
              child: Text(
                msg,
                textAlign: TextAlign.left,
                style: AppStyle.textstylerobotoromanregular13.copyWith(
                    fontSize: 15, height: 1.23, color: ColorConstant.gray400),
              ),
            ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 100, left: 5, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
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
                      ColorConstant.blue500,
                      ColorConstant.blue500,
                    ],
                  ),
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(top: 15, bottom: 15, left: 60, right: 60),
                  child: Text(
                    "OK",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textstylerobotoromanbold131
                        .copyWith(fontSize: 15, color: ColorConstant.whiteA700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
