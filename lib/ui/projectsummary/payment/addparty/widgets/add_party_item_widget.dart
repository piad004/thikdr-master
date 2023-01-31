import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import '../../../../../database/note.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';

class AddPartyItemWidget extends StatelessWidget {
  //AddPartyItemWidget(this._itemModel);
  AddPartyItemWidget(this._itemModel,this.index,this.onTileSelected);

  //AddPartyItemModel _itemModel;
  Contact _itemModel;
  //Note _itemModel;
  int index;
  final Function(int) onTileSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => {
          onTileSelected(index),
          /*Navigator.pop(context, {
           //'name': (_itemModel),
           'name': (_itemModel.displayName != null)?_itemModel.displayName:"",
            'mobile': (_itemModel.phones != null && _itemModel.phones!.length>0 &&
                _itemModel.phones![0] != null)?_itemModel.phones![0].value.toString():"",
          })*/
        },
        child: Container(
          //width: size.width/2-25,
          margin: EdgeInsets.only(

          ),
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.circular(
            0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: getSize(
                        45.00,
                      ),
                      width: getSize(
                        45.00,
                      ),
                      child: Image.asset(
                        ImageConstant.imgUser1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              11.00,
                            ),
                            top: getVerticalSize(
                              4.00,
                            ),
                            bottom: getVerticalSize(
                              2.00,
                            ),
                          ),
                          child: Text(
                            //_itemModel.name,
                            (_itemModel != null &&
                                   /* _itemModel.displayName != null)
                                ? _itemModel.displayName.toString()*/
                                    _itemModel.displayName != null)
                                ? _itemModel.displayName.toString()
                                : "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanbold16.copyWith(
                              fontSize: getFontSize(
                                16,
                              ),
                              height: 1.00,
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              11.00,
                            ),
                            top: getVerticalSize(
                              2.00,
                            ),
                            bottom: getVerticalSize(
                              2.00,
                            ),
                          ),
                          child: Text(
                            //_itemModel.mobile,
                            (_itemModel != null &&
                                 /*   _itemModel.phones != null &&
                                    _itemModel.phones!.length > 0 &&
                                    _itemModel.phones![0].value != null)
                                ? _itemModel.phones![0].value.toString()*/
                                    _itemModel.phones != null &&
                                    _itemModel.phones!.length > 0)
                                ? _itemModel.phones![0].value.toString()
                                : "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylerobotoromanbold16.copyWith(
                              fontSize: getFontSize(
                                13,
                              ),
                              fontWeight: FontWeight.normal,
                              color: ColorConstant.black900,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        Divider(
          height: 1,
          color: ColorConstant.gray300,
        ),
            ],
          ),
        ),
      ),
    );
  }
}
