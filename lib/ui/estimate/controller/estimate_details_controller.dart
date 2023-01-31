
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get.dart';
import '../models/estimate_details_model.dart';

class EstimateDetailsController extends GetxController
    with StateMixin<dynamic> {
  Rx<EstimateDetailsModel> estimateDetailsModelObj = EstimateDetailsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
