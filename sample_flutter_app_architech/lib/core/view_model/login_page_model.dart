

import 'package:sample_flutter_app_architech/core/request_model/create_request.dart';
import 'package:sample_flutter_app_architech/core/services/api.dart';
import 'package:sample_flutter_app_architech/core/services/webservice_urls.dart';

import '../../locator.dart';
import 'base_model.dart';

class InitialPageModel extends BaseModel {
  Api _api = locator<Api>();

  String errorMessage;

  String saltValue = "";

  Future<Map<String, dynamic>> searchUser(userId) async {
    var response;
    var requestString1 = await CreateRequest().userSearch(userId: userId);

    String URL = await getURL(GET_USER);
    print("Url:" + URL);

    response = await _api.restApi(URL, requestString1);
    print("after api called");
    return response;
  }
}
