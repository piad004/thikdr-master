import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

import '../models/project_summary_model.dart';

class ProjectSummaryController extends GetxController with StateMixin<dynamic> {
  ProjectSummaryController(this.projectSummaryModelObj);

  TextEditingController stockSummaryController = TextEditingController();

  Rx<ProjectSummaryModel> projectSummaryModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    stockSummaryController.dispose();
  }
}
