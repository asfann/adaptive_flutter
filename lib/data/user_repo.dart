import 'api_constants.dart';
import 'package:adaptive_flutter/data/base_dio_request.dart';
import 'package:dio/dio.dart';

class UserRepository extends BaseDioApiRequest{
  String registrationUrl = '$BASE_URL + $login_URL';

  Future<String> registrationUser(String username, String identificator, String password) async {
    final Response response =
      await BaseDioApiRequest().sendRequest(
        url: login_URL,
        body: {
          "userName": username,
          "identificator": identificator,
          "password": password,
          "referral": "string",
          "language": "En",
          "timeZone": "string",
          "clientId": "string",
          "url": "string",
          "captchaName": "string",
          "captchaToken": "string",
        },
      );
    return response.data["signinToken"].toString();
  }
}