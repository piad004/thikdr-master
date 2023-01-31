class SkillModel {
  final bool? error;
  final String? message;
  final Data? data;

  SkillModel({required this.error, required this.message,required this.data});

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      error : json['error'],
      message : json['message'],
      data : json['data'] != null ? new Data.fromJson(json['data']) : null,
    );
  }

  /* SkillModel1.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }*/

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
  List<SkillList>? list;

  Data({this.list});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <SkillList>[];
      json['list'].forEach((v) {
        list?.add(new SkillList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkillList {
  int? id;
  String? name;
  String? img;

  SkillList({this.id, this.name, this.img});

  SkillList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}
