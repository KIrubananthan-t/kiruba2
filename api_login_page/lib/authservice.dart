import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  // Define the URL
  final String _url = 'https://apimatrix-backend-dev.nxtplatform.io/Api/Auth/Authenticate';

  // Authentication method
  Future<void> authenticate(String username, String password) async {
    try {
      // Prepare the request body and headers
      final response = await http.post(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      // Check the response status
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Authentication successful. Response: $data');
        // Process token or user data
      } else {
        print('Failed to authenticate. Status: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred during authentication: $e');
    }
  }
}
