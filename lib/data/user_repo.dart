import 'package:adaptive_flutter/data/secure_storage_client.dart';

import 'api_constants.dart';
import 'package:adaptive_flutter/data/base_dio_request.dart';
import 'package:dio/dio.dart';

class UserRepository extends BaseDioApiRequest {
  String registrationUrl = '$BASE_URL + $login_URL';

  Future<String> registrationUser(
      String username, String identificator, String password) async {
    final Response response = await BaseDioApiRequest().sendRequest(
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
    return response.data["signingToken"].toString();
  }

  Future<String> confirmUser(String password, String code) async {
    final token = SharedPreferencesRepository().getToken();
    print(token);
    if (token != null) {
      final Response response = await BaseDioApiRequest().sendRequest(
        type: RequestType.put,
        url: confirm_URL,
        body: {
          "token": token,
          "password": password,
          "codeList": [
            {
              "nfaServiceType": "Email",
              "code": code,
            }
          ],
          "clientId": "string",
          "captchaName": "string",
          "captchaToken": "string"
        },
      );
      if (response.data['token'] != null) {
        return response.data['token'].toString();
      } else {
        throw Exception('Invalid code');
      }
    } else {
      throw Exception('No token');
    }

  }
}
