class LeadDetailsModel {
  final bool? error;
  final String? message;
  final Data? data;

  LeadDetailsModel({required this.error, required this.message,required this.data});

  factory LeadDetailsModel.fromJson(Map<String, dynamic> json) {
    return LeadDetailsModel(
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
  Details? details;

  Data({this.details});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      details : json['details'] != null ? new Details.fromJson(json['details']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details;
    }
    return data;
  }
}

class Details {
  var id;
  var user;
  var address;
  var phone;
  var category;
  var postDate;
  var leadDate;
  var leadTime;
  var leadStatus;
  var estmdPrice;
  var salePrice;
  var description;
  var budget;
  var unit;
  var qty;
  var duration;
  var requiredFor;
  var roleOfEnquire;
  var userEmail;
  var cfOrderId;
  var orderId;
  var orderToken;
  var paymentLink;
  var type;
  var job_type;
  var price_range;
  var buy_status;
  var buy_price;

  Details({this.id, this.user, this.address,this.phone, this.category,this.postDate, this.leadDate,
    this.leadTime, this.leadStatus,this.estmdPrice, this.salePrice,this.description, this.budget,this.unit,
    this.qty, this.duration,this.requiredFor, this.roleOfEnquire,this.userEmail,
    this.cfOrderId,this.orderId, this.orderToken,this.paymentLink,this.type,this.job_type,this.price_range,
    this.buy_status,this.buy_price,});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    address = json['address'];
    phone = json['phone'];
    category = json['category'];
    postDate = json['post_date'];
    leadDate = json['lead_date'];
    leadTime = json['lead_time'];
    leadStatus = json['lead_status'];
    estmdPrice = json['estmd_price'];
    salePrice = json['sale_price'];
    description = json['description'];
    budget = json['budget'];
    unit = json['unit'];
    qty = json['qty'];
    duration = json['duration'];
    requiredFor = json['required_for'];
    roleOfEnquire = json['role_of_enquire'];
    userEmail = json['user_email'];
    cfOrderId = json['cf_order_id'];
    orderId = json['order_id'];
    orderToken = json['order_token'];
    paymentLink = json['paymentlink'];
    type = json['type'];
    job_type = json['job_type'];
    price_range = json['price_range'];
    buy_status = json['buy_status'];
    buy_price = json['buy_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['category'] = this.category;
    data['post_date'] = this.postDate;
    data['lead_date'] = this.leadDate;
    data['lead_time'] = this.leadTime;
    data['lead_status'] = this.leadStatus;
    data['estmd_price'] = this.estmdPrice;
    data['sale_price'] = this.salePrice;
    data['description'] = this.description;
    data['budget'] = this.budget;
    data['unit'] = this.unit;
    data['qty'] = this.qty;
    data['duration'] = this.duration;
    data['required_for'] = this.requiredFor;
    data['role_of_enquire'] = this.roleOfEnquire;
    data['user_email'] = this.userEmail;
    data['cf_order_id'] = this.cfOrderId;
    data['order_id'] = this.orderId;
    data['order_token'] = this.orderToken;
    data['paymentlink'] = this.paymentLink;
    data['type'] = this.type;
    data['job_type'] = this.job_type;
    data['price_range'] = this.price_range;
    data['buy_status'] = this.buy_status;
    data['buy_price'] = this.buy_price;
    return data;
  }
}