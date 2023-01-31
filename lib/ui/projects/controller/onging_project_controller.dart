import 'package:get/get.dart';

import '../models/onging_project_model.dart';

class OngingProjectController extends GetxController with StateMixin<dynamic> {
  OngingProjectController(this.ongingProjectModelObj);

  Rx<OngingProjectModel> ongingProjectModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
