
import 'package:thikdr/ui/login/mvvm_login/check_user_model.dart';

class CheckUserViewModel {

  final CheckUserModel checkUserModel;

  CheckUserViewModel(this.checkUserModel);

  bool get error {
    return this.checkUserModel.error;
  }

  String get message {
    return this.checkUserModel.message;
  }

}