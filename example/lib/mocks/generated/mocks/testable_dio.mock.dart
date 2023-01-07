// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:example/mocks/testable_dio.dart';
import 'package:dio/dio.dart';
import 'package:mock/mock.dart';
import 'dart:core';

class MockTestableDio implements TestableDio {
  final dynamic _info = MockTestableDioClassInfoImpl();
  MockTestableDioClassInfo get info => _info as MockTestableDioClassInfo;
  void Function(bool force)? onClose;
  Future<Response<T>> Function<T>(
      String path,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress)? onGet;
  Future<Response<T>> Function<T>(
      Uri uri,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress)? onGetUri;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPost;
  Future<Response<T>> Function<T>(
      Uri uri,
      dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPostUri;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPut;
  Future<Response<T>> Function<T>(
      Uri uri,
      dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPutUri;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken)? onHead;
  Future<Response<T>> Function<T>(
          Uri uri, dynamic data, Options? options, CancelToken? cancelToken)?
      onHeadUri;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken)? onDelete;
  Future<Response<T>> Function<T>(
          Uri uri, dynamic data, Options? options, CancelToken? cancelToken)?
      onDeleteUri;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPatch;
  Future<Response<T>> Function<T>(
      Uri uri,
      dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onPatchUri;
  void Function()? onLock;
  void Function()? onUnlock;
  void Function()? onClear;
  Future<Response<dynamic>> Function(
      String urlPath,
      dynamic savePath,
      void Function(int, int)? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError,
      String lengthHeader,
      dynamic data,
      Options? options)? onDownload;
  Future<Response<dynamic>>? downloadReturnValue;
  Future<Response<dynamic>> Function(
      Uri uri,
      dynamic savePath,
      void Function(int, int)? onReceiveProgress,
      CancelToken? cancelToken,
      bool deleteOnError,
      String lengthHeader,
      dynamic data,
      Options? options)? onDownloadUri;
  Future<Response<dynamic>>? downloadUriReturnValue;
  Future<Response<T>> Function<T>(
      String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onRequest;
  Future<Response<T>> Function<T>(
      Uri uri,
      dynamic data,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress)? onRequestUri;
  Future<Response<T>> Function<T>(RequestOptions requestOptions)? onFetch;
  BaseOptions? getOptionsReturnValue;
  BaseOptions Function()? onOptionsGet;
  void Function(BaseOptions value)? onOptionsSet;
  HttpClientAdapter? getHttpClientAdapterReturnValue;
  HttpClientAdapter Function()? onHttpClientAdapterGet;
  void Function(HttpClientAdapter value)? onHttpClientAdapterSet;
  Transformer? getTransformerReturnValue;
  Transformer Function()? onTransformerGet;
  void Function(Transformer value)? onTransformerSet;
  Interceptors? getInterceptorsReturnValue;
  Interceptors Function()? onInterceptorsGet;

  MockTestableDio({
    this.onClose,
    this.onGet,
    this.onGetUri,
    this.onPost,
    this.onPostUri,
    this.onPut,
    this.onPutUri,
    this.onHead,
    this.onHeadUri,
    this.onDelete,
    this.onDeleteUri,
    this.onPatch,
    this.onPatchUri,
    this.onLock,
    this.onUnlock,
    this.onClear,
    this.onDownload,
    this.downloadReturnValue,
    this.onDownloadUri,
    this.downloadUriReturnValue,
    this.onRequest,
    this.onRequestUri,
    this.onFetch,
    this.onOptionsGet,
    this.getOptionsReturnValue,
    this.onOptionsSet,
    this.onHttpClientAdapterGet,
    this.getHttpClientAdapterReturnValue,
    this.onHttpClientAdapterSet,
    this.onTransformerGet,
    this.getTransformerReturnValue,
    this.onTransformerSet,
    this.onInterceptorsGet,
    this.getInterceptorsReturnValue,
  });

  @override
  void close({bool force = false}) {
    _info.close(force: force);
    if (onClose != null) {
      return onClose!.call(force);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) {
    _info.get<T>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    if (onGet != null) {
      return onGet!
          .call(path, queryParameters, options, cancelToken, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> getUri<T>(Uri uri,
      {Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) {
    _info.getUri<T>(uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    if (onGetUri != null) {
      return onGetUri!.call(uri, options, cancelToken, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> post<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.post<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPost != null) {
      return onPost!.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> postUri<T>(Uri uri,
      {dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.postUri<T>(uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPostUri != null) {
      return onPostUri!.call(
          uri, data, options, cancelToken, onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> put<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.put<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPut != null) {
      return onPut!.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> putUri<T>(Uri uri,
      {dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.putUri<T>(uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPutUri != null) {
      return onPutUri!.call(
          uri, data, options, cancelToken, onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> head<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) {
    _info.head<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
    if (onHead != null) {
      return onHead!.call(path, data, queryParameters, options, cancelToken);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> headUri<T>(Uri uri,
      {dynamic data, Options? options, CancelToken? cancelToken}) {
    _info.headUri<T>(uri,
        data: data, options: options, cancelToken: cancelToken);
    if (onHeadUri != null) {
      return onHeadUri!.call(uri, data, options, cancelToken);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> delete<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) {
    _info.delete<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
    if (onDelete != null) {
      return onDelete!.call(path, data, queryParameters, options, cancelToken);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> deleteUri<T>(Uri uri,
      {dynamic data, Options? options, CancelToken? cancelToken}) {
    _info.deleteUri<T>(uri,
        data: data, options: options, cancelToken: cancelToken);
    if (onDeleteUri != null) {
      return onDeleteUri!.call(uri, data, options, cancelToken);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> patch<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.patch<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPatch != null) {
      return onPatch!.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> patchUri<T>(Uri uri,
      {dynamic data,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.patchUri<T>(uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onPatchUri != null) {
      return onPatchUri!.call(
          uri, data, options, cancelToken, onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void lock() {
    _info.lock();
    if (onLock != null) {
      return onLock!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void unlock() {
    _info.unlock();
    if (onUnlock != null) {
      return onUnlock!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void clear() {
    _info.clear();
    if (onClear != null) {
      return onClear!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<dynamic>> download(String urlPath, dynamic savePath,
      {void Function(int, int)? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      dynamic data,
      Options? options}) {
    _info.download(urlPath, savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: options);
    if (onDownload != null) {
      return onDownload!.call(
          urlPath,
          savePath,
          onReceiveProgress,
          queryParameters,
          cancelToken,
          deleteOnError,
          lengthHeader,
          data,
          options);
    } else if (downloadReturnValue != null) {
      return downloadReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<dynamic>> downloadUri(Uri uri, dynamic savePath,
      {void Function(int, int)? onReceiveProgress,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      dynamic data,
      Options? options}) {
    _info.downloadUri(uri, savePath,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: options);
    if (onDownloadUri != null) {
      return onDownloadUri!.call(uri, savePath, onReceiveProgress, cancelToken,
          deleteOnError, lengthHeader, data, options);
    } else if (downloadUriReturnValue != null) {
      return downloadUriReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> request<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.request<T>(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onRequest != null) {
      return onRequest!.call(path, data, queryParameters, cancelToken, options,
          onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> requestUri<T>(Uri uri,
      {dynamic data,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) {
    _info.requestUri<T>(uri,
        data: data,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    if (onRequestUri != null) {
      return onRequestUri!.call(
          uri, data, cancelToken, options, onSendProgress, onReceiveProgress);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    _info.fetch<T>(requestOptions);
    if (onFetch != null) {
      return onFetch!.call(requestOptions);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  BaseOptions get options {
    _info.options;
    if (onOptionsGet != null) {
      return onOptionsGet!.call();
    } else if (getOptionsReturnValue != null) {
      return getOptionsReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set options(BaseOptions value) {
    _info.options = value;
    if (onOptionsSet != null) {
      return onOptionsSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  HttpClientAdapter get httpClientAdapter {
    _info.httpClientAdapter;
    if (onHttpClientAdapterGet != null) {
      return onHttpClientAdapterGet!.call();
    } else if (getHttpClientAdapterReturnValue != null) {
      return getHttpClientAdapterReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set httpClientAdapter(HttpClientAdapter value) {
    _info.httpClientAdapter = value;
    if (onHttpClientAdapterSet != null) {
      return onHttpClientAdapterSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Transformer get transformer {
    _info.transformer;
    if (onTransformerGet != null) {
      return onTransformerGet!.call();
    } else if (getTransformerReturnValue != null) {
      return getTransformerReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set transformer(Transformer value) {
    _info.transformer = value;
    if (onTransformerSet != null) {
      return onTransformerSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Interceptors get interceptors {
    _info.interceptors;
    if (onInterceptorsGet != null) {
      return onInterceptorsGet!.call();
    } else if (getInterceptorsReturnValue != null) {
      return getInterceptorsReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }
}

class MockTestableDioClassInfoImpl extends MockClassInfo
    implements MockTestableDioClassInfo {}

abstract class MockTestableDioClassInfo {}
