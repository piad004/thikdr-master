
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thikdr/ui/projectsummary/material/models/material_item_model.dart';
import 'package:thikdr/ui/projectsummary/material/widgets/material_item_widget.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../job/models/Job_item_model.dart';

class ProjectMaterialPage extends StatefulWidget {
  @override
  State<ProjectMaterialPage> createState() => _ProjectMaterialState();
}

class _ProjectMaterialState extends State<ProjectMaterialPage> {

  final List<MaterialItemModel> _list = [
    MaterialItemModel(''),
    MaterialItemModel( ''),
    MaterialItemModel(''),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(
                left: getHorizontalSize(
                  15.00,
                ),
                top: getVerticalSize(
                  25.00,
                ),
                right: getHorizontalSize(
                  15.00,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorConstant.deepOrange400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ),
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
                  bottomRight: Radius.circular(
                    getHorizontalSize(
                      0.00,
                    ),
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        10.00,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          8.00,
                        ),
                        right: getHorizontalSize(
                          8.00,
                        ),
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Material",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        0.00,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          8.00,
                        ),
                        right: getHorizontalSize(
                          8.00,
                        ),
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Total In",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getHorizontalSize(
                        70.00,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.only(

                        left: getHorizontalSize(
                          8.00,
                        ),
                        right: getHorizontalSize(
                          8.00,
                        ),
                        top: getVerticalSize(
                          8.00,
                        ),
                        bottom: getVerticalSize(
                          8.00,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange600,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "Remaining",
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylerobotoromanregular136
                            .copyWith(
                          fontSize: getFontSize(
                            13,
                          ),
                          height: 0.62,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  16.00,
                ),
                top: getVerticalSize(
                  5.00,
                ),
                right: getHorizontalSize(
                  16.00,
                ),
              ),
              child:
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                _list.length,
                itemBuilder: (context, index) {
                  MaterialItemModel model =
                  _list[index];
                  return MaterialItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  16.00,
                ),
                top: getVerticalSize(
                  54.00,
                ),
                right: getHorizontalSize(
                  16.00,
                ),
              ),
              child:
              Container(
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
                      ColorConstant.red900,
                      ColorConstant.deepOrange400De,
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          84.00,
                        ),
                        top: getVerticalSize(
                          19.00,
                        ),
                        bottom: getVerticalSize(
                          18.00,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8.00,
                        ),
                        width: getSize(
                          8.00,
                        ),
                        child: SvgPicture.asset(
                          ImageConstant.imgPlus,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          5.00,
                        ),
                        top: getVerticalSize(
                          15.00,
                        ),
                        right: getHorizontalSize(
                          70.00,
                        ),
                        bottom: getVerticalSize(
                          14.00,
                        ),
                      ),
                      child: Text(
                        "ADD MATERIAL FROM LIBRARY",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                        AppStyle.textstylerobotoromanbold141.copyWith(
                          fontSize: getFontSize(
                            14,
                          ),
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
    );
  }
}