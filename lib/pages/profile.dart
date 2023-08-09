import 'package:flutter/material.dart';

import 'data_display_page.dart';
//import 'package:david/widgets/header.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: prefer_final_fields
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applicants Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              onSubmitted: (email) {
                // Navigate to the page displaying data from Firestore
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataDisplayPage(email: email),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the page displaying data from Firestore
                String enteredEmail = _emailController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataDisplayPage(email: enteredEmail),
                  ),
                );
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
