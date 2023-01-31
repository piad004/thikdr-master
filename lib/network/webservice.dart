import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:thikdr/ui/home/model/slider/slider_model.dart';
import 'package:thikdr/ui/leads/leaddetails/model/lead_details_model.dart';
import 'package:thikdr/ui/login/mvvm_login/check_user_model.dart';
import 'package:thikdr/ui/login/mvvm_login/verify_otp_model.dart';
import 'package:thikdr/ui/login/skill_model.dart';
import 'package:thikdr/utils/pref_utils.dart';

import '../ui/leads/leaddetails/model/lead_model.dart';

class Webservice {
  var baseUrl = "https://b2b.primacyinfotech.com/thikadar/api/";

  Future<CheckUserModel> requestContractorRegistration(
      roleId,
      email,
      name,
      mobile,
      companyName,
      contactNumber,
      isWhatsAppNumber,
      skill,
      workCity,
      workState,
      lat,
      lng,
      isGstRegister,
      gstNumber,
      panNumber) async {
    final url = Uri.parse(baseUrl + "auth/contractor-register");
    final response = await http.post(url, body: {
      'role_id': roleId,
      'email': email,
      'name': name,
      'mobile': mobile,
      'company_name': companyName,
      'contact_number': contactNumber,
      'is_whatsapp_number': isWhatsAppNumber,
      'skils': skill,
      'work_location': workCity,
      'state': workState,
      'lat': lat,
      'lng': lng,
      'gst_register': isGstRegister,
      'gst_number': gstNumber,
      'pan_number': panNumber,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      print("response contractor : $body");
      // Map results =  json.decode(response.body);

      if (body['error'] != true) {
        PrefUtils().savePreferencesData("token", body['data']['token']);
        return CheckUserModel.fromJson(body);
      }
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<CheckUserModel> requestLabourRegistration(
    roleId,
    email,
    name,
    mobile,
    gender,
    age,
    dailyRate,
    skill,
    workLocation,
    lat,
    lng,
  ) async {
    final url = Uri.parse(baseUrl + "auth/labour-register");
    final response = await http.post(url, body: {
      'role_id': roleId,
      'email': email,
      'name': name,
      'mobile': mobile,
      'gender': gender,
      'age': age,
      'skils': skill,
      'daily_rate': dailyRate,
      'work_location': workLocation,
      'lat': lat,
      'lng': lng,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("response labour : $body");

      // Map results =  json.decode(response.body);

      if (body['error'] != true){
        PrefUtils().savePreferencesData("token", body['data']['token']);
        return CheckUserModel.fromJson(body);
      }
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<SkillModel> requestSkillList() async {
    final url = Uri.parse(baseUrl + "skills-list?role_id=4");
    final response = await http.get(
      url, /*body: {
      'mobile' : mobile
    }*/
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Map results =  json.decode(response.body);
      // SkillModel1 user = SkillModel1(data: null).fromJson(body);

      return SkillModel.fromJson(body);
    } else {
      // throw Exception("Unable to perform request!");
      return SkillModel(
          error: false,
          message: jsonDecode(response.body)['message'],
          data: jsonDecode(response.body)['data']);
    }
  }

  Future<SkillModel> requestRoleList() async {
    final url = Uri.parse(baseUrl + "role-list");
    final response = await http.get(
      url, /*body: {
      'mobile' : mobile
    }*/
    );
//var b = (jsonDecode(response.body)).toString();
    // print("role response1 :"+jsonDecode(response.body));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      //print("role response1 :"+body);

      // Map results =  json.decode(response.body);
      // SkillModel1 user = SkillModel1(data: null).fromJson(body);

      return SkillModel.fromJson(body);
    } else {
      // throw Exception("Unable to perform request!");
      return SkillModel(
          error: false,
          message: jsonDecode(response.body)['message'],
          data: jsonDecode(response.body)['data']);
    }
  }

  Future<SkillModel> requestCityList() async {
    final url = Uri.parse(baseUrl + "location-list");
    final response = await http.get(
      url, /*body: {
      'mobile' : mobile
    }*/
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Map results =  json.decode(response.body);
      // SkillModel1 user = SkillModel1(data: null).fromJson(body);

      return SkillModel.fromJson(body);
    } else {
      // throw Exception("Unable to perform request!");
      return SkillModel(
          error: false,
          message: jsonDecode(response.body)['message'],
          data: jsonDecode(response.body)['data']);
    }
  }
  Future<SkillModel> requestStateList() async {
    final url = Uri.parse(baseUrl + "state-list?country_id=1");
    final response = await http.get(
      url, /*body: {
      'mobile' : mobile
    }*/
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Map results =  json.decode(response.body);
      // SkillModel1 user = SkillModel1(data: null).fromJson(body);

      return SkillModel.fromJson(body);
    } else {
      // throw Exception("Unable to perform request!");
      return SkillModel(
          error: false,
          message: jsonDecode(response.body)['message'],
          data: jsonDecode(response.body)['data']);
    }
  }

  Future<CheckUserModel> requestCheckUser(String mobile) async {
    final url = Uri.parse(baseUrl + "auth/login");
    final response = await http.post(url, body: {'mobile': mobile});
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        // Map results =  json.decode(response.body);
        if (body['error'] != true)
          return CheckUserModel.fromJson(body);
        else {
          throw (body['message']);
        }
      } else {
        throw "Something went wrong!";
      }
    } catch (e) {
      throw ("Server error!");
    }
  }

  Future<CheckUserModel> requestResendOtp(String mobile) async {
    final url = Uri.parse(baseUrl + "auth/resend-otp");
    final response = await http.post(url, body: {'mobile': mobile});
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Map results =  json.decode(response.body);
      if (body['error'] != true)
        return CheckUserModel.fromJson(body);
      else {
        throw (body['message']);
      }
    } else {
      // throw Exception("Unable to perform request!");
      throw ("Server error!");
    }
  }

  Future<VerifyOtpModel> requestVerifyOtp(String mobile, String otp) async {
    final url = Uri.parse(baseUrl + "auth/verify-otp");
    final response = await http.post(url, body: {
      'mobile': mobile,
      'otp': otp,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['error'] != true)
        return VerifyOtpModel.fromJson(body);
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<SliderModel> requestSliderAndUserData(String token) async {
    final url = Uri.parse(baseUrl + "wallet-balance");
    final response = await http.get(url, headers: {
      'Authorization': "Bearer " + token,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['error'] != true)
        return SliderModel.fromJson(body);
      else {
        throw ("Something went wrong!");
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<LeadModel> requestPopularLeadsList(String token) async {
    final url = Uri.parse(baseUrl + "popularleads-list");
    final response = await http.get(url, headers: {
      'Authorization': "Bearer " + token,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("$url : $body");

      if (body['error'] != true)
        return LeadModel.fromJson(body);
      else {
        throw (body['error']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<LeadModel> requestLeadsList(String token) async {
    final url = Uri.parse(baseUrl + "leads-list");
    final response = await http.get(url, headers: {
      'Authorization': "Bearer " + token,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("$url : $body");
      if (body['error'] != true)
        return LeadModel.fromJson(body);
      else {
        throw (body['error']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<LeadDetailsModel> requestLeadsDetails(
      String token, String leadId) async {
    final url = Uri.parse(baseUrl + "leads-details?lead_id=" + leadId);
    final response = await http.get(
      url,
      headers: {
        'Authorization': "Bearer " + token,
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("$url : "+body.toString());

      if (body['error'] != true)
        return LeadDetailsModel.fromJson(body);
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<LeadModel> requestMyLeadsList(String token) async {
    final url = Uri.parse(baseUrl + "myleads-list");
    final response = await http.get(url, headers: {
      'Authorization': "Bearer " + token,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      print("$url : $body");

      if (body['error'] != true)
        return LeadModel.fromJson(body);
      else {
        throw ("Something went wrong!");
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<CheckUserModel> requestBuyLeads(
    String token,
    String userId,
    String leadId,
    String transId,
    String price,
    String jsonValue,
  ) async {
    final url = Uri.parse(baseUrl + "buy-leads");
    final response = await http.post(url, headers: {
      'Authorization': "Bearer " + token,
    }, body: {
      'user_id': userId,
      'lead_id': leadId + "04",
      'trns_id': transId,
      'price': price,
      'json_value': jsonValue,
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body['error'] != true)
        return CheckUserModel.fromJson(body);
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }

  Future<CheckUserModel> requestEstimateItemAdd(
    String token,
    String name,
    String qty,
    String rate,
    String unit,
    String subtotal,
    String tax,
    String total,
  ) async {
    final url = Uri.parse(baseUrl + "estimate-item-add");
    final response = await http.post(url, headers: {
      'Authorization': "Bearer " + token,
    }, body: {
      'name': name,
      'qty': qty,
      'rate': rate,
      'unit': unit,
      'subtotal': subtotal,
      'tax': tax,
      'total': total,
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body['error'] != true)
        return CheckUserModel.fromJson(body);
      else {
        throw (body['message']);
      }
    } else {
      throw ("Server error!");
    }
  }
}
