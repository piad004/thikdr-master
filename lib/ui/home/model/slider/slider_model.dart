class SliderModel {
  final bool? error;
  final String? message;
  final Data? data;

  SliderModel({required this.error, required this.message,required this.data});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      error : json['error'],
      message : json['message'],
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
  List<SliderImgList>? list;
  UserData? userData;

  Data({this.list,this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['slider_list'] != null) {
      list = <SliderImgList>[];
      json['slider_list'].forEach((v) {
        list?.add(new SliderImgList.fromJson(v));
      });
    }
    userData = json['list'] != null ? new UserData.fromJson(json['list']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['slider_list'] = this.list?.map((v) => v.toJson()).toList();
    }
    if (this.userData != null) {
      data['list'] = this.userData?.toJson();
    }

    return data;
  }
}

class SliderImgList {
  var img;

  SliderImgList({this.img});

  SliderImgList.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    return data;
  }
}

class UserData {
  var id;
  var name;
  var phone;
  var wallet_balance;

  UserData({this.id,this.name,this.phone,this.wallet_balance});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    wallet_balance = json['wallet_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['wallet_balance'] = this.wallet_balance;
    return data;
  }
}