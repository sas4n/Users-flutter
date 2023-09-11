import 'package:http/http.dart' as http;
import 'package:users_flutter/core/constants.dart';

class UserApiCall {
  Future<http.Response> fetchAllUsers(int pageNr) async {
    final String url = '${ApiUrl.baseApiUrl}/${ApiUrl.userUrl}/?pageNr=$pageNr';
    final Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    return response;
  }
}
