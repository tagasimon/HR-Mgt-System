import 'dart:convert';

import 'package:client_app/features/admin/models/API_Request_Model.dart';
import 'package:flutter/material.dart';
// import http package
import 'package:http/http.dart' as http;

class ApiRequestsRepo {
  final String baseUrl;
  ApiRequestsRepo({required this.baseUrl});

  // get all api requests
  Future<List<ApiRequestModel>?> getAllApiRequests() async {
    final response = await http.get(Uri.parse('$baseUrl/api/requests'));
    debugPrint('Response: ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> apiRequests = jsonDecode(response.body);
      return apiRequests.map((e) => ApiRequestModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load api requests');
    }
  }
}
