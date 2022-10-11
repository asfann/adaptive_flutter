class RegistrationModel {
  String userName;
  String identificator;
  String password;
  String referral;
  String language;
  String timeZone;
  String clientId;
  String url;
  String captchaName;
  String captchaToken;

  RegistrationModel({
    required this.userName,
    required this.identificator,
    required this.password,
    required this.referral,
    required this.language,
    required this.timeZone,
    required this.clientId,
    required this.url,
    required this.captchaName,
    required this.captchaToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['identificator'] = identificator;
    data['password'] = password;
    data['referral'] = referral;
    data['language'] = language;
    data['timeZone'] = timeZone;
    data['clientId'] = clientId;
    data['url'] = url;
    data['captchaName'] = captchaName;
    data['captchaToken'] = captchaToken;
    return data;
  }
}
