class ResendModel {
  String accessToken;
  int accessTokenLifetime;
  String refreshToken;
  String signingStatus;
  List<MfaList> mfaList;

  ResendModel({
    required this.accessToken,
    required this.accessTokenLifetime,
    required this.refreshToken,
    required this.signingStatus,
    required this.mfaList,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['accessTokenLifetime'] = accessTokenLifetime;
    data['refreshToken'] = refreshToken;
    data['signingStatus'] = signingStatus;
    data['mfaList'] = mfaList.map((v) => v.toJson()).toList();
    return data;
  }
}

class MfaList {
  String mfaServiceType;

  MfaList({required this.mfaServiceType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mfaServiceType'] = mfaServiceType;
    return data;
  }
}
