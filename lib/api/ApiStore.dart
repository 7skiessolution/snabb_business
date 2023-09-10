import 'package:dio/dio.dart';
import 'package:snabb_business/static_data.dart';

Dio httpClient() {
  final options = BaseOptions(
      baseUrl: 'https://snabbbusniess.7skiessolutions.net/api/',
      headers: {"Content-Type": "application/json", ...getAuthHeader()});
  return Dio(options);
}

Dio httpFormDataClient() {
  final options = BaseOptions(
      baseUrl: 'https://snabbbusniess.7skiessolutions.net/api/',
      headers: {"Content-Type": "multipart/form-data", ...getAuthHeader()});
  return Dio(options);
}

Map<String, String> getAuthHeader() {
  return {
    "Authorization": "Bearer ${StaticValues.token}",
    "X-API-Key": StaticValues.apikey
  };
}
