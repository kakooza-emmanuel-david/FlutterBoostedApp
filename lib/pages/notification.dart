import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<RemoteMessage> notifications =
      []; // List to store received notifications

  @override
  void initState() {
    super.initState();

    // You can call the function to initialize notifications here if needed
    // For example: Update().initNotifications();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Add the received notification to the list
      setState(() {
        notifications.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final message = notifications[index];
          return ListTile(
            title: Text(message.notification?.title ?? 'No title'),
            subtitle: Text(message.notification?.body ?? 'No body'),
            onTap: () {
              // Navigate to a detailed view of the notification if needed
              // For example: Navigator.push(...);
            },
          );
        },
      ),
    );
  }
}
