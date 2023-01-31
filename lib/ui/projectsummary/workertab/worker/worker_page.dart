import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker/models/worker_item_model.dart';
import 'package:thikdr/ui/projectsummary/workertab/worker/widgets/worker_item_widget.dart';
import 'package:thikdr/utils/color_constant.dart';

import '../../../../theme/app_style.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';

class WorkerPage extends StatefulWidget {
  @override
  State<WorkerPage> createState() => _WorkerState();
}

class _WorkerState extends State<WorkerPage> with TickerProviderStateMixin{
  TextEditingController searchbynameController = TextEditingController();

  List<WorkerItemModel> _list =[
    WorkerItemModel(""),
    WorkerItemModel(""),
    WorkerItemModel(""),
    WorkerItemModel(""),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: getHorizontalSize(
            1.00,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(
                44.00,
              ),
              child: TextFormField(
                controller: searchbynameController,
                decoration: InputDecoration(
                  hintText: "Search worker...",
                  hintStyle: AppStyle.textstylerobotoromanregular147.copyWith(
                    fontSize: getFontSize(
                      16.0,
                    ),
                    color: ColorConstant.gray700,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        45.00,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: ColorConstant.gray301,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        45.00,
                      ),
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
                        10.00,
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        22.00,
                      ),
                      width: getSize(
                        22.00,
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
                      46.00,
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
                      10.00,
                    ),
                    bottom: getVerticalSize(
                      10.00,
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
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    1.00,
                  ),
                  top: getVerticalSize(
                    25.00,
                  ),
                ),
                child:ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                    _list.length,
                    itemBuilder: (context, index) {
                      WorkerItemModel model = _list[index];
                      return WorkerItemWidget(
                        model,
                      );
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
