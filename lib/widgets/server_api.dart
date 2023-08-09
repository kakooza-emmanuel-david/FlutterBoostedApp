// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerApi {
  static const String baseUrl = 'http://localhost:3000'; // Replace with your server URL

  static Future<void> registerDeviceToken(String token) async {
    const url = '$baseUrl/api/register-device-token';
    final response = await http.post(Uri.parse(url), body: {
      'registrationToken': token,
    });
    if (response.statusCode == 200) {
      print('Device token registered successfully');
    } else {
      print('Failed to register device token');
    }
  }

  static Future<void> sendNotification(String message) async {
    const url = '$baseUrl/api/send-notification';
    final response = await http.post(Uri.parse(url), body: {
      'message': message,
    });
    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification');
    }
  }

  static Future<List<String>> getMessages() async {
    const url = '$baseUrl/api/get-messages';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final messages = json.decode(response.body) as List<dynamic>;
      return messages.map((message) => message.toString()).toList();
    } else {
      print('Failed to retrieve messages');
      return [];
    }
  }
}
