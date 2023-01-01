// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/testable_dio.dart';
import 'package:dio/dio.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockTestableDio implements TestableDio {
  final void Function(bool)? onClose;
  final Future<Response<T>> Function<T>(String, Map<String, dynamic>?, Options?,
      CancelToken?, void Function(int, int)?)? onGet;
  final Future<Response<T>> Function<T>(
      Uri, Options?, CancelToken?, void Function(int, int)?)? onGetUri;
  final Future<Response<T>> Function<T>(
      String,
      dynamic,
      Map<String, dynamic>?,
      Options?,
      CancelToken?,
      void Function(int, int)?,
      void Function(int, int)?)? onPost;
  final Future<Response<T>> Function<T>(Uri, dynamic, Options?, CancelToken?,
      void Function(int, int)?, void Function(int, int)?)? onPostUri;
  final Future<Response<T>> Function<T>(
      String,
      dynamic,
      Map<String, dynamic>?,
      Options?,
      CancelToken?,
      void Function(int, int)?,
      void Function(int, int)?)? onPut;
  final Future<Response<T>> Function<T>(Uri, dynamic, Options?, CancelToken?,
      void Function(int, int)?, void Function(int, int)?)? onPutUri;
  final Future<Response<T>> Function<T>(
      String, dynamic, Map<String, dynamic>?, Options?, CancelToken?)? onHead;
  final Future<Response<T>> Function<T>(Uri, dynamic, Options?, CancelToken?)?
      onHeadUri;
  final Future<Response<T>> Function<T>(
      String, dynamic, Map<String, dynamic>?, Options?, CancelToken?)? onDelete;
  final Future<Response<T>> Function<T>(Uri, dynamic, Options?, CancelToken?)?
      onDeleteUri;
  final Future<Response<T>> Function<T>(
      String,
      dynamic,
      Map<String, dynamic>?,
      Options?,
      CancelToken?,
      void Function(int, int)?,
      void Function(int, int)?)? onPatch;
  final Future<Response<T>> Function<T>(Uri, dynamic, Options?, CancelToken?,
      void Function(int, int)?, void Function(int, int)?)? onPatchUri;
  final void Function()? onLock;
  final void Function()? onUnlock;
  final void Function()? onClear;
  final Future<Response<dynamic>> Function(
      String,
      dynamic,
      void Function(int, int)?,
      Map<String, dynamic>?,
      CancelToken?,
      bool,
      String,
      dynamic,
      Options?)? onDownload;
  final Future<Response<dynamic>> Function(
      Uri,
      dynamic,
      void Function(int, int)?,
      CancelToken?,
      bool,
      String,
      dynamic,
      Options?)? onDownloadUri;
  final Future<Response<T>> Function<T>(
      String,
      dynamic,
      Map<String, dynamic>?,
      CancelToken?,
      Options?,
      void Function(int, int)?,
      void Function(int, int)?)? onRequest;
  final Future<Response<T>> Function<T>(Uri, dynamic, CancelToken?, Options?,
      void Function(int, int)?, void Function(int, int)?)? onRequestUri;
  final Future<Response<T>> Function<T>(RequestOptions)? onFetch;
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
    this.onDownloadUri,
    this.onRequest,
    this.onRequestUri,
    this.onFetch,
  });

  @override
  void close({bool force = false}) =>
      onClose?.call(force) as dynamic ?? (throw UnimplementedError());

  @override
  Future<Response<T>> get<T>(String path,
          {Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onReceiveProgress}) =>
      onGet?.call(
              path, queryParameters, options, cancelToken, onReceiveProgress)
          as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> getUri<T>(Uri uri,
          {Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onReceiveProgress}) =>
      onGetUri?.call(uri, options, cancelToken, onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> post<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPost?.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> postUri<T>(Uri uri,
          {dynamic data,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPostUri?.call(uri, data, options, cancelToken, onSendProgress,
          onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> put<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPut?.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> putUri<T>(Uri uri,
          {dynamic data,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPutUri?.call(uri, data, options, cancelToken, onSendProgress,
          onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> head<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken}) =>
      onHead?.call(path, data, queryParameters, options, cancelToken)
          as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> headUri<T>(Uri uri,
          {dynamic data, Options? options, CancelToken? cancelToken}) =>
      onHeadUri?.call(uri, data, options, cancelToken) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> delete<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken}) =>
      onDelete?.call(path, data, queryParameters, options, cancelToken)
          as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> deleteUri<T>(Uri uri,
          {dynamic data, Options? options, CancelToken? cancelToken}) =>
      onDeleteUri?.call(uri, data, options, cancelToken) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> patch<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPatch?.call(path, data, queryParameters, options, cancelToken,
          onSendProgress, onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> patchUri<T>(Uri uri,
          {dynamic data,
          Options? options,
          CancelToken? cancelToken,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onPatchUri?.call(uri, data, options, cancelToken, onSendProgress,
          onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  void lock() => onLock?.call() as dynamic ?? (throw UnimplementedError());

  @override
  void unlock() => onUnlock?.call() as dynamic ?? (throw UnimplementedError());

  @override
  void clear() => onClear?.call() as dynamic ?? (throw UnimplementedError());

  @override
  Future<Response<dynamic>> download(String urlPath, dynamic savePath,
          {void Function(int, int)? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          CancelToken? cancelToken,
          bool deleteOnError = true,
          String lengthHeader = Headers.contentLengthHeader,
          dynamic data,
          Options? options}) =>
      onDownload?.call(urlPath, savePath, onReceiveProgress, queryParameters,
          cancelToken, deleteOnError, lengthHeader, data, options) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<dynamic>> downloadUri(Uri uri, dynamic savePath,
          {void Function(int, int)? onReceiveProgress,
          CancelToken? cancelToken,
          bool deleteOnError = true,
          String lengthHeader = Headers.contentLengthHeader,
          dynamic data,
          Options? options}) =>
      onDownloadUri?.call(uri, savePath, onReceiveProgress, cancelToken,
          deleteOnError, lengthHeader, data, options) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> request<T>(String path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          CancelToken? cancelToken,
          Options? options,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onRequest?.call(path, data, queryParameters, cancelToken, options,
          onSendProgress, onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> requestUri<T>(Uri uri,
          {dynamic data,
          CancelToken? cancelToken,
          Options? options,
          void Function(int, int)? onSendProgress,
          void Function(int, int)? onReceiveProgress}) =>
      onRequestUri?.call(uri, data, cancelToken, options, onSendProgress,
          onReceiveProgress) as dynamic ??
      (throw UnimplementedError());

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) =>
      onFetch?.call(requestOptions) as dynamic ?? (throw UnimplementedError());
}
