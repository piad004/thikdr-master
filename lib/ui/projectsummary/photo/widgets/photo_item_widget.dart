import 'package:flutter/cupertino.dart';

import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import '../models/photo_item_model.dart';

class PhotoItemWidget extends StatelessWidget {
  PhotoItemWidget(this._itemModel);

  PhotoItemModel _itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getVerticalSize(
          2,
        ),
        bottom: getVerticalSize(
          2,
        ),
      ),
      decoration: BoxDecoration(
          color: ColorConstant.gray102,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              5.00,
            ),
          )),
      child: Container(
        height: getSize(
          100.00,
        ),
        width: getSize(
          100.00,
        ),
        child: Image.asset(
          ImageConstant.imgUser,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
