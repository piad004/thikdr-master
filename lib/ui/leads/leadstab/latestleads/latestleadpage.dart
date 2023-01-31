
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thikdr/ui/leads/leadstab/latestleads/widgets/leads_item_widget.dart';

import '../../../../network/webservice.dart';
import '../../../../utils/math_utils.dart';
import '../../../../utils/pref_utils.dart';
import '../../../../utils/progress_dialog_utils.dart';
import '../../../login/mvvm_login/check_user_model.dart';
import '../../leaddetails/model/lead_model.dart';
import 'controller/leads_controller.dart';
import 'models/leads_item_model.dart';
import 'models/leads_model.dart';

class LatestLeadsPage extends StatefulWidget {
  @override
  State<LatestLeadsPage> createState() => _LatestLeadsState();
}

class _LatestLeadsState extends State<LatestLeadsPage>  with TickerProviderStateMixin, WidgetsBindingObserver  {

  List<LeadList> _list = [];
  bool isCancelAble=false;

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async{
    if (!await InternetConnectionChecker().hasConnection) {
      showMsg("Check internet connection!");
    }else {
      getLatestLeads();
    }
  }

  Future<void> getLatestLeads() async {
    try {
      if (mounted)
      ProgressDialogUtils().progressDialogue(context);

      var token= await PrefUtils().getPreferencesData("token");

      LeadModel leadModel = await Webservice().requestLeadsList(token.toString());

      if (!leadModel.error!) {
        setState(() {
          _list = leadModel.data!.list!;
          isCancelAble=true;
        });
      }

      ProgressDialogUtils().hideProgressDialog(context,mounted);
      print('response : ${jsonEncode(leadModel)}');

    } catch (e) {
      ProgressDialogUtils().hideProgressDialog(context,mounted);
      showMsg(e.toString());
      if (mounted)
      setState(() {
        isCancelAble=true;
      });
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
      child:
      Padding(
      padding: EdgeInsets.only(
        left: getHorizontalSize(
          1.00,
        ),
        right: getHorizontalSize(
          1.00,
        ),
      ),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _list.length,
          itemBuilder: (context, index) {
            LeadList model =
            _list[index];
            return LeadsItemWidget(
              model,
            );
          },
        ),
    ),
    );
  }

  progressDialogue(BuildContext context) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: isCancelAble,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () async => isCancelAble, child: alert);
      },
    );
  }
}