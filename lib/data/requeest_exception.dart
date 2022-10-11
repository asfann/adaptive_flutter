// ignore_for_file: constant_identifier_names

enum RequestExceptionCode{
  NoInternet,
  NotFound,
  BadRequest,
  Unknown
}

class RequestException implements Exception{
  RequestExceptionCode code;
  late String message;


  RequestException({required this.code, String? msg}) {
    switch (code) {
      case RequestExceptionCode.NoInternet:
        message = msg ?? 'No Internet';
        break;
      case RequestExceptionCode.NotFound:
        message = msg ?? 'This Data Not Found';
        break;
      case RequestExceptionCode.BadRequest:
        message = msg ?? 'Bad Request';
        break;
      case RequestExceptionCode.Unknown:
        message = msg ?? 'Unknown';
        break;
    }
  }
}