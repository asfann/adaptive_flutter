class ConfirmModel {
  String token;
  String password;
  List<CodeList> codeList;
  String clientId;
  String captchaName;
  String captchaToken;

  ConfirmModel(
      {required this.token,
      required this.password,
      required this.codeList,
      required this.clientId,
      required this.captchaName,
      required this.captchaToken,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['password'] = password;
    data['codeList'] = codeList.map((v) => v.toJson()).toList();
    data['clientId'] = clientId;
    data['captchaName'] = captchaName;
    data['captchaToken'] = captchaToken;
    return data;
  }
}

class CodeList {
  String nfaServiceType;
  String code;

  CodeList({required this.nfaServiceType,required this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nfaServiceType'] = nfaServiceType;
    data['code'] = code;
    return data;
  }
}
