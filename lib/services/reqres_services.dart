import 'dart:io';

import 'package:alert_learn/model/reqres_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IReqresService {
  Future<List<ReqresModel>?> fetchListItemAdvance();
}

class ReqresService implements IReqresService {
  late final Dio _dio;
  ReqresService() : _dio = Dio(BaseOptions(baseUrl: _ReqresServiceUrl.url._url()));

  @override
  Future<List<ReqresModel>?> fetchListItemAdvance() async {
    try {
      final response = await _dio.get(_ReqresServiceUrl.page._url());
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data['data'];
        if (datas is List) {
          return datas.map<ReqresModel>((e) => ReqresModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug()._showDioException(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  void _showDioException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('---------------------------------');
    }
  }
}

enum _ReqresServiceUrl { url, page }

extension _ReqresServiceUrlExtension on _ReqresServiceUrl {
  String _url() {
    switch (this) {
      case _ReqresServiceUrl.url:
        return 'https://reqres.in/api/';
      case _ReqresServiceUrl.page:
        return 'users?page';
    }
  }
}
