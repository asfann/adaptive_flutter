
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'requeest_exception.dart';

enum RequestType{
  post,
  put,
  get,
}



class BaseDioApiRequest {
  final Dio _dio = Dio();

  BaseDioApiRequest();

  Future<Response> sendRequest(
      {required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, RequestType type = RequestType.post}) async {
    try {
      print(queryParameters);
      print(BASE_URL + url);
      Response response;
      switch(type){
        case RequestType.post:
           response = await _dio.post(BASE_URL + url, queryParameters: queryParameters, data: body);
          break;
        case RequestType.put:
           response = await _dio.put(BASE_URL + url, queryParameters: queryParameters, data: body);
        break;
        case RequestType.get:
           response = await _dio.get(BASE_URL + url, queryParameters: queryParameters);
          break;
      }
      print(response.data);
      return response;
    } on DioError catch (e) {
      if(e.response?.statusCode != null && e.response!.statusCode! >= 400){
        switch(e.response!.statusCode){
          case 400:
            throw RequestException(code: RequestExceptionCode.BadRequest);
          case 404:
            throw RequestException(code: RequestExceptionCode.NotFound);
        }
      }
      throw RequestException(code: RequestExceptionCode.Unknown);
    } catch(e){
      throw RequestException(code: RequestExceptionCode.NoInternet);
    }
  }
}
