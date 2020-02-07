import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:sample_flutter_app_architech/core/utils/error_messages.dart';


String createErrorJsonString(int statusCode) {
  String errorResponse = json.encode({
      "success": false,
      "message":ErrorMessage().getErrorMessage(statusCode),
  });
  return errorResponse;
}




Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
