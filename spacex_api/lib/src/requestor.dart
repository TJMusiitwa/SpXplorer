import 'package:dio/dio.dart' as dio;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class Requestor {
  static const _baseUrl = "https://api.spacexdata.com/v4/";

  Future<dio.Response> getData({
    required String endpoint,
    String? id,
    Object? query,
    Object? header,
  }) {
    if (id != null) {
      return getById(endpoint, id);
    } else if (query != null) {
      return postMethod(endpoint, query, header);
    }
    return getMethod(endpoint);
  }

  Future<dio.Response> getMethod(String endpoint) async {
    final url = "$_baseUrl$endpoint";
    return await dio.Dio()
        .get(url, options: CacheOptions(store: MemCacheStore()).toOptions());
  }

  Future<dio.Response> getById(String endpoint, String id) async {
    final url = "$_baseUrl$endpoint/$id";
    return await dio.Dio()
        .get(url, options: CacheOptions(store: MemCacheStore()).toOptions());
  }

  Future<dio.Response> postMethod(
    String endpoint,
    Object query,
    Object? header,
  ) async {
    final url = "$_baseUrl$endpoint/query";

    if (header == null) {
      header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return await dio.Dio().post(url,
        data: query,
        queryParameters: header as Map<String, dynamic>,
        options: CacheOptions(store: MemCacheStore()).toOptions());
  }
}
