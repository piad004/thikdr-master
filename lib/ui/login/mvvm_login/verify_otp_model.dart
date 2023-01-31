class VerifyOtpModel {
  bool error=false;
  String message='';
  Data data= Data(isRegistered: 0,token: "");

  VerifyOtpModel(this.error, this.message, this.data);

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : Data(isRegistered: 0,token: "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int isRegistered=0;
 String token="";

  Data({required this.isRegistered, required this.token});

  Data.fromJson(Map<String, dynamic> json) {
    isRegistered = json['is_registered'];
    token = json['token'];
    }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_registered'] = this.isRegistered;
    data['token'] = this.token;

    return data;
  }
}
