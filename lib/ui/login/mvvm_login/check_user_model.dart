class CheckUserModel {
  var error;
  var message;
  final Data? data;

  CheckUserModel({required this.error, required this.message, required this.data});

  factory CheckUserModel.fromJson(Map<String, dynamic> json) {
    return CheckUserModel(
        error: json["error"],
        message: json["message"],
        data : json['data'] != null ? new Data.fromJson(json['data']) : null,
    );
  }

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  final int otp;
  final String mobile;
  final int isRegistered;
  final String token;

  Data({required this.otp, required this.mobile,required this.isRegistered, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        otp: json['otp'] != null ? json["otp"] : 0,
        mobile: json['mobile'] != null ? json["mobile"] : "",
        isRegistered: json['is_registered'] != null ? json["is_registered"] : 0,
        token: json['token'] != null ? json["token"] : "",
    );
  }

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['mobile'] = this.mobile;
    data['is_registered'] = this.isRegistered;
    data['token'] = this.token;
    return data;
  }
}


