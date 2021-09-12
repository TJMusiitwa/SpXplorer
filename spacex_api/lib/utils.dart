import 'package:dio/dio.dart' as dio;
import 'dart:convert' as convert;

class Utils {
  /// Response as it comes from the server converted to JSON
  static dynamic parseResponseAsJson(String response) {
    return convert.jsonDecode(response) as Map<String, dynamic>;
  }

  /// [response] from the server.
  ///
  /// [func] is passed as the `<T>.fromJson` for any model
  static dynamic convertResponseToList<T>(dio.Response response, func) {
    final json = Utils.parseResponseAsJson(response.data.toString());
    return json.map((e) => func(e)).cast<T>().toList();
  }
}
