import 'dart:convert';

import 'package:hello_world/api_helpers/apiResponse.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://192.168.0.3:8080/api';
}

class ApiService {
  static Future<ApiResponse> registerCustomer(body) async {
    final response = await http.post('${URLS.BASE_URL}/customers',
        body: json.encode(body),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    print('response: ${response.statusCode}');

    if (response.statusCode == 200) {
      var rsp = ApiResponse.fromJson(json.decode(response.body));

      return rsp;
    } else {
      return null;
    }
  }

  static Future<ApiResponse> getCustomers() async {
    final response = await http.get('${URLS.BASE_URL}/customers');
    print('response: ${response.statusCode}');

    if (response.statusCode == 200) {
      var rsp = ApiResponse.fromJson(json.decode(response.body));
      return rsp;
    } else {
      return null;
    }
  }
}
