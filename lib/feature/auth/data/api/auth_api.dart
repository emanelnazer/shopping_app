import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/app_apis.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/data/model/request/login_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/request/register_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/response/login_response_Dtol.dart';
import 'package:shopping_app/feature/auth/data/model/response/register_response_Dto.dart';

class AuthApi {
  Future<ResultAPI<LoginResponseDto>> loginAuth(LoginRequestDto requst) async {
    Uri Url = Uri.https(AppApis.baseUrl, AppApis.LoginUrl);
    try {
      var response = await http.post(Url, body: requst.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode == 401) {
        return ErrorAPI<LoginResponseDto>(
            messageError: "Don't have account please try again");
      } else {
        return SuccessAPI<LoginResponseDto>(
            data: LoginResponseDto.fromJson(json));
      }
    } catch (e) {
      return ErrorAPI<LoginResponseDto>(messageError: e.toString());
    }
  }

  Future<ResultAPI<RegisterResponseDto>> RegisterAuth(
      RegisterRequestDto requstt) async {
    Uri url = Uri.https(AppApis.baseUrl, AppApis.RegistUrl);
    try {
      var response = await http.post(url);
      var responsebody = response.body;
      var json1 = jsonDecode(responsebody);
      var registermodel = RegisterResponseDto.fromJson(json1);
      return SuccessAPI<RegisterResponseDto>(data: registermodel);
    } catch (e) {
      return ErrorAPI<RegisterResponseDto>(messageError: e.toString());
    }
  }
}
