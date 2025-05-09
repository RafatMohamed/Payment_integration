import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiResponse {
  final bool status;
  final int statusCode;
  final dynamic data;
  final String message;

  ApiResponse({
    required this.status,
    required this.statusCode,
    this.data,
    required this.message,
  });
  bool get hasData => status && data != null;
  // Factory method to handle Dio responses
  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse(
      status: response.data["status"] ?? false,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: response.data["message"]??'An error occurred.',
    );
  }

  // Factory method to handle Dio or other exceptions
  factory ApiResponse.fromError(dynamic error) {
    if (error is DioException) {
      log('DioException type: ${error.type}');
      log('DioException error: ${error.message}');

      String message = _handleDioError(error);

      return ApiResponse(
        status: false,
        data: error.response,
        statusCode: error.response?.statusCode ?? 500,
        message: message,
      );
    } else if (error is SocketException) {
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: "No internet connection or DNS lookup failed.",
      );
    } else {
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: 'Something went wrong. Please check your network and try again.',
      );
    }
  }
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please check your internet.";
      case DioExceptionType.sendTimeout:
        return "Send timeout. Try again.";
      case DioExceptionType.receiveTimeout:
        return "Receiving data timed out. Try again.";
      case DioExceptionType.badResponse:
        return _handleServerError(error.response);
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        if (error.message?.contains("Failed host lookup") == true) {
          return "DNS lookup failed. Check your internet or VPN/firewall settings.";
        }
        return "No internet connection or host unreachable.";
      default:
        return "Unexpected error. Check your internet connection.";
    }
  }
  /// Handling errors from the server response
  static String _handleServerError(Response? response) {
     debugPrint(  response?.data.toString());
    if (response == null) return "No response from server.";
    if (response.data is Map<String, dynamic>) {
      return response.data["message"] ?? "An error occurred.";
    }
    return "Server error: ${response.statusMessage}";
  }
}

