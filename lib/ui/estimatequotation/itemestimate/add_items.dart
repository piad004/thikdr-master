import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/estimate/addestimate/model/item_model.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import 'add_item_estimate.dart';
import 'items/widgets/item_widget.dart';

class AddItemsPage extends StatefulWidget {
  ItemModel itemModel;
  AddItemsPage(this.itemModel);

  @override
  State<AddItemsPage> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItemsPage> with TickerProviderStateMixin {
  //late TabController _tabController;

  TextEditingController searchItemsbyController = TextEditingController();
  var hsn ="HSN12345";
  var unit ="Unit 1";
  var total ="1500";
  var list = ["",""];

  @override
  void initState() {
    super.initState();
   /* this._tabController =
    (TabController(vsync: this, length: 3));*/

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
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
              "Items".toUpperCase(),
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
          bottomSheet:
          Container(
            height:50,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 5,
              right: 8,
              bottom: 5,
            ),
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
                  ColorConstant.red900,
                  ColorConstant.deepOrange400De,
                ],
              ),
            ),
            child:
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddItemEstimatePage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 10,
                        top: 15,
                        bottom: 16,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        child: Container(
                          height: 10,
                          width: 10,
                          child: SvgPicture.asset(
                            ImageConstant.imgPlus,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                        top: 12,
                        bottom: 12,
                      ),
                      child: Text(
                        "Add Item".toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanbold131.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),
          body:
          SingleChildScrollView(
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius: BorderRadius.circular(
                       5,
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
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                5.00,
                              ),
                              bottom: getVerticalSize(
                                5.00,
                              ),
                            ),
                            child: Container(
                              height: 46,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                controller: searchItemsbyController,
                                decoration: InputDecoration(
                                  hintText: "Search Items by Name or Code",
                                  hintStyle: AppStyle.textstylerobotoromanregular147
                                      .copyWith(
                                    fontSize: 14,
                                    color: ColorConstant.gray700,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                     25,
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorConstant.gray301,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      25,
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorConstant.gray301,
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        10.00,
                                      ),
                                      right: getHorizontalSize(
                                        18.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getSize(
                                        16.00,
                                      ),
                                      width: getSize(
                                        16.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgSearch,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    minWidth: getSize(
                                      16.00,
                                    ),
                                    minHeight: getSize(
                                      56.00,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: ColorConstant.whiteA700,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      15.00,
                                    ),
                                    top: getVerticalSize(
                                      9.00,
                                    ),
                                    bottom: getVerticalSize(
                                      9.00,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: ColorConstant.gray700,
                                  fontSize: getFontSize(
                                    14.0,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ItemsWidget ('');
                    },
                  ),
                ),
              ],
            ),
          )
        ));
  }
}
