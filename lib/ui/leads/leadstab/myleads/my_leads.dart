import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thikdr/ui/leads/leadstab/myleads/widgets/my_leads_item_widget.dart';
import 'package:thikdr/ui/widget/data_not_fount.dart';

import '../../../../network/webservice.dart';
import '../../../../theme/app_style.dart';
import '../../../../utils/color_constant.dart';
import '../../../../utils/image_constant.dart';
import '../../../../utils/math_utils.dart';
import '../../../../utils/pref_utils.dart';
import '../../../../utils/progress_dialog_utils.dart';
import '../../leaddetails/model/lead_model.dart';

class MyLeadsPage extends StatefulWidget {
  @override
  State<MyLeadsPage> createState() => _MyLeadsState();
}

class _MyLeadsState extends State<MyLeadsPage> with TickerProviderStateMixin, WidgetsBindingObserver {
  //MyLeadsController controller = Get.put(MyLeadsController(MyLeadsModel().obs));
  TextEditingController searchbynameController = TextEditingController();

  // Rx<MyLeadsModel> myLeadsModelObj = MyLeadsModel().obs;
  List<LeadList> _list = [];
  bool isFetching=true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async {
    if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    } else {
      getMyLeads();
    }
  }

  Future<void> getMyLeads() async {
    try {
      if (mounted)
      ProgressDialogUtils().progressDialogue(context);

      var token = await PrefUtils().getPreferencesData("token");

      LeadModel leadModel =
          await Webservice().requestMyLeadsList(token.toString());

      if (!leadModel.error!) {
        setState(() {
          isFetching = false;
          _list = leadModel.data!.list!;
        });
      }
      if (mounted)
        ProgressDialogUtils().hideProgressDialog(context,mounted);
      print('response : ${jsonEncode(leadModel)}');

    } catch (e) {
      setState(() {
        isFetching = false;
      });
      if (mounted)
        ProgressDialogUtils().hideProgressDialog(context,mounted);
      showMsg(e.toString());
    }
  }

  void showMsg(String msg) {
    if (mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
  }

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
                  hintText: "Search by name, city or mobile",
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
            if (_list.length > 0)
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
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      LeadList model = _list[index];
                      return MyLeadsItemWidget(
                        model,
                      );
                    },
                  ),
                ),
              )
            else if (_list.length < 1 && isFetching==false)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      1.00,
                    ),
                    top: getVerticalSize(
                      95.00,
                    ),
                  ),
                  child: DataNotFound()
                ),
              ),
          ],
        ),
      ),
    );
  }
}
