import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/materiallibrary/addmaterial/add_used_material_page.dart';
import 'package:thikdr/ui/materiallibrary/models/material_library_item_model.dart';
import 'package:thikdr/ui/materiallibrary/widgets/materiallist_item_widget.dart';

import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';

class MaterialLibraryPage extends StatefulWidget {
  @override
  State<MaterialLibraryPage> createState() => _MaterialLibraryState();
}

class _MaterialLibraryState extends State<MaterialLibraryPage>
    with TickerProviderStateMixin {
  TextEditingController searchMaterialController = TextEditingController();

  final List<MaterialLibraryItemModel> materialLibraryModelObj = [
    MaterialLibraryItemModel(""),
    MaterialLibraryItemModel(""),
    MaterialLibraryItemModel(""),
    MaterialLibraryItemModel(""),
    MaterialLibraryItemModel(""),
  ];

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
          "Material Library".toUpperCase(),
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    33.00,
                  ),
                  bottom: getVerticalSize(
                    20.00,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.00,
                    ),
                    right: getHorizontalSize(
                      14.00,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: getHorizontalSize(
                            1.00,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            44.00,
                          ),
                          width: getHorizontalSize(
                            MediaQuery.of(context).size.width,
                          ),
                          child: TextFormField(
                            controller: searchMaterialController,
                            decoration: InputDecoration(
                              hintText: "Search Material",
                              hintStyle:
                                  AppStyle.textstylerobotoromanbold16.copyWith(
                                fontSize: getFontSize(
                                  16.0,
                                ),
                                color: ColorConstant.gray500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    25.00,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: ColorConstant.bluegray100,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    25.00,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: ColorConstant.bluegray100,
                                  width: 1,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    10.00,
                                  ),
                                  right: getHorizontalSize(
                                    12.00,
                                  ),
                                ),
                                child: Container(
                                  height: getSize(
                                    18.00,
                                  ),
                                  width: getSize(
                                    18.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgSearch,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                minWidth: getSize(
                                  18.00,
                                ),
                                minHeight: getSize(
                                  18.00,
                                ),
                              ),
                              filled: true,
                              fillColor: ColorConstant.whiteA700,
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  16.00,
                                ),
                                top: getVerticalSize(
                                  15.00,
                                ),
                                bottom: getVerticalSize(
                                  15.00,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: ColorConstant.gray500,
                              fontSize: getFontSize(
                                16.0,
                              ),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddUsedMaterialPage()));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                4.00,
                              ),
                              top: getVerticalSize(
                                15.00,
                              ),
                              right: getHorizontalSize(
                                2.33,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: getSize(
                                        36.00,
                                      ),
                                      width: getSize(
                                        36.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgCar,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          13.00,
                                        ),
                                        top: getVerticalSize(
                                          10.00,
                                        ),
                                        bottom: getVerticalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Add New Material",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textstylerobotoromanbold167
                                            .copyWith(
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      10.48,
                                    ),
                                    bottom: getVerticalSize(
                                      9.78,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      15.74,
                                    ),
                                    width: getHorizontalSize(
                                      8.20,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgRightArrow,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              2.00,
                            ),
                            top: getVerticalSize(
                              20.00,
                            ),
                          ),
                          child: (materialLibraryModelObj.length == 0)
                              ? Text("No data found!")
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: materialLibraryModelObj.length,
                                  itemBuilder: (context, index) {
                                    MaterialLibraryItemModel model =
                                        materialLibraryModelObj[index];
                                    return MateriallistItemWidget(
                                      model,
                                    );
                                  },
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
      ),
    ));
  }
}
