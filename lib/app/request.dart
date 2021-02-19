/*
* Author: Fatih Mert Doğancan
* WWW:    https://fatihmert.dev
* Github: https://github.co/fatihmert
* */

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'config.dart';
import 'package:http/http.dart' as http;

import 'enums.dart';

class Request extends http.BaseClient {
  final Client _client = Client();

  Request();

  String endpoint(String url) {
    if (ApiEndPoint.TEST == Config.API_TEST) {
      return "https://jsonplaceholder.typicode.com/$url";
    }

    return '${Uri.parse(Config.API).toString()}/$url';
  }

  void _logEndpoint(String method, String url) {
    if (Config.API_LOG_STATUS == ApiLog.ACTIVE) {
      print('[${method.toUpperCase().toString()}] ${endpoint(url).toString()}');
    }
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    Config.HEADERS.forEach((key, val) {
      request.headers[key] = val;
    });

    // request.headers['Content-type'] = 'application/json';
    // request.headers['Accept'] = 'application/json';
    // request.headers['Cache-Control'] = 'no-cache';

    return this._client.send(request);
  }

  @override
  Future<http.Response> head(url, {Map<String, String> headers}) {
    this._logEndpoint('head', url);
    return this._client.head(endpoint(url), headers: headers);
  }

  @override
  Future<http.Response> get(url, {Map<String, String> headers}) {
    this._logEndpoint('get', url);
    return this._client.get(endpoint(url), headers: headers);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    this._logEndpoint('post', url);
    return this
        ._client
        .post(endpoint(url), headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    this._logEndpoint('put', url);
    return this
        ._client
        .put(endpoint(url), headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    this._logEndpoint('patch', url);
    return this
        ._client
        .patch(endpoint(url), headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(url, {Map<String, String> headers}) {
    this._logEndpoint('delete', url);
    return this._client.delete(endpoint(url), headers: headers);
  }
}
