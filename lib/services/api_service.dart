import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../helpers/loading_widget.dart';

class ApiService {
  final Dio _dio;
  final String apiUrl;
  final String endPoint;
  final Map<String, dynamic> setHeaders;
  final Map<String, dynamic> setParam;
  final String setMethot;
  final String setContentType;
  final bool loading;

  ApiService(
    this.apiUrl,
    this.endPoint, {
    this.setHeaders = const {},
    this.setMethot = 'post',
    this.setParam = const {},
    this.loading = false,
    this.setContentType = 'application/x-www-form-urlencoded',
  }) : _dio = Dio();

  Future<dynamic> fetchData() async {
    Map<String, dynamic> dataResponse;
    try {
      // print('DIO PARAM = $setParam');
      if (loading) Lt.loading('Loading', mask: true);
      final response = (setMethot == 'get')
          ? await _dio.get(
              apiUrl + endPoint,
              data: setParam,
              options: Options(
                responseType: ResponseType.plain,
                headers: (setHeaders.isNotEmpty) ? setHeaders : null,
              ),
            )
          : await _dio.post(
              apiUrl + endPoint,
              data: (setParam.isNotEmpty)
                  ? (setContentType == 'application/x-www-form-urlencoded')
                      ? setParam
                      : FormData.fromMap(setParam)
                  : null,
              options: Options(
                responseType: ResponseType.plain,
                headers: (setHeaders.isNotEmpty) ? setHeaders : null,
              ),
            );
      try {
        dataResponse = {
          'error': false,
          'data': json.decode(response.data),
        };
        // print('DIO RESPONSE = $dataResponse');
        Lt.close();
        return dataResponse;
      } on FormatException {
        dataResponse = {
          'error': true,
          'error_msg': 'response not Json',
          'error_body': response.data,
          'data': null
        };
        // print('DIO RESPONSE = $dataResponse');
        Lt.close();
        return dataResponse;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.error is SocketException) {
          dataResponse = {
            'error': true,
            'error_socket': true,
            'error_msg': e.error.toString(),
            'data': null,
          };
        } else {
          try {
            dataResponse = {
              'error': true,
              'error_msg': e.message,
              'data': json.decode(e.response!.data),
            };
          } on FormatException {
            dataResponse = {
              'error': true,
              'error_msg': e.message,
              'data': null
            };
          }
        }
      } else {
        dataResponse = {
          'error': true,
          'error_msg': e.toString(),
          'data': null,
        };
      }
      if (dataResponse.containsKey('error_socket')) {
        Lt.close();
        Lt.toast('No internet connetion !');
      } else {
        Lt.close();
      }
      // print('DIO RESPONSE = $dataResponse');
      return dataResponse;
    }
  }
}
