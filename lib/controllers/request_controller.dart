// import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:symmetryk/statics.dart';

class RequestController {
  Future<http.Response> get({required String apiRoute,Map<String, String>? headers}) async {
    final response = env == Environment.development
        ? await http.get(Uri.http(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10))
        : await http.get(Uri.https(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }

  Future<http.Response> post({required String apiRoute, required Map<String, dynamic> body,Map<String, String>? headers}) async {
    final response = env == Environment.development
        ? await http.post(Uri.http(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10))
        : await http.post(Uri.https(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }

  Future<http.Response> put({required String apiRoute, required Map<String, dynamic> body,Map<String, String>? headers}) async {
    final response = env == Environment.development
        ? await http.put(Uri.http(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10))
        : await http.put(Uri.https(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }

  Future<http.Response> delete({required String apiRoute,Map<String, String>? headers}) async {
    final response = env == Environment.development
        ? await http.delete(Uri.http(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10))
        : await http.delete(Uri.https(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }
}