import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:thikdr/ui/estimate/addestimate/model/item_model.dart';
import '../../../../../database/note.dart';
import '../../../../../theme/app_style.dart';
import '../../../../../utils/color_constant.dart';
import '../../../../../utils/image_constant.dart';
import '../../../../../utils/math_utils.dart';

class ItemWidget extends StatelessWidget {

  ItemWidget(this._itemModel,this.index,this.onItemSelected);

  ItemModel _itemModel;
  int index;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    var totalWithOutGstPrice = double.parse(_itemModel.salePrice)*double.parse(_itemModel.qty);
    var totalGst = (totalWithOutGstPrice*double.parse(_itemModel.gst))/100;
    return Align(
      alignment: Alignment.center,
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
            Container(
              margin: EdgeInsets.only(top:5,bottom: 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            _itemModel.itemName,
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
                        Container(
                          child: Text(
                            "₹ ${(totalWithOutGstPrice+totalGst).toStringAsFixed(2)}",
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top:5,bottom:5,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    "Qty x Rate",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize:12,
                                        height: 1.00,
                                        color: ColorConstant.gray400,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${_itemModel.qty} ${_itemModel.unit} x ${_itemModel.salePrice}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize:12,
                                        height: 1.00,
                                        color: ColorConstant.gray400,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5,right: 10),
                                  child: Text(
                                    "Tax",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold16.copyWith(
                                        fontSize:12,
                                        height: 1.00,
                                        color: ColorConstant.gray400,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_itemModel.gst}% = ${totalGst.toStringAsFixed(2)}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.textstylerobotoromanbold16.copyWith(
                                      fontSize:12,
                                      height: 1.00,
                                      color: ColorConstant.gray400,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => {
                            onItemSelected(index),
                            /*Navigator.pop(context, {
           //'name': (_itemModel),
           'name': (_itemModel.displayName != null)?_itemModel.displayName:"",
            'mobile': (_itemModel.phones != null && _itemModel.phones!.length>0 &&
                _itemModel.phones![0] != null)?_itemModel.phones![0].value.toString():"",
          })*/
                          },
                          child: Container(
                            /*
                                                      margin: EdgeInsets.only(
                                                        bottom: getVerticalSize(
                                                          10.00,
                                                        ),
                                                      ),*/

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius
                                    .circular(
                                 5,
                                ),
                              ),
                              child:
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                  child: Text('Edit'))),
                        ),
                      ],
                    ),
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
    );
  }
}
