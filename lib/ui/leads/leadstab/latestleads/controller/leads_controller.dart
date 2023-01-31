import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get.dart';
import '../models/leads_model.dart';

class LeadsController extends GetxController with StateMixin<dynamic> {
  LeadsController(this.leadsModelObj);

  Rx<LeadsModel> leadsModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
