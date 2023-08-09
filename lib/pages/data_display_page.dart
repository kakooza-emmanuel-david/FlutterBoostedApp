import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataDisplayPage extends StatelessWidget {
  final String email;

  const DataDisplayPage({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applicants Profile'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('internship_applications')
            .where('email', isEqualTo: email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No data available for this email.'),
            );
          }

          // Since email is unique, we'll just take the first document found
          final document = snapshot.data!.docs.first;
          final data = document.data() as Map<String, dynamic>;

          final name = data['name'] ?? 'N/A';
          final phoneNumber = data['phone'] ?? 'N/A';
          final university = data['university'] ?? 'N/A';
          final course = data['course'] ?? 'N/A';
          final skill = data['skill'] ?? 'N/A';
          final field = data['field'] ?? 'N/A';
          final year = data['year'] ?? 'N/A';
          final department = data['department'] ?? 'N/A';
          final gender = data['gender'] ?? 'N/A';

         
        return Center(
            child: Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.orange, // Adjust the size as needed
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text('Name: $name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: $email'),
                        Text('Phone Number: $phoneNumber'),
                        Text('University: $university'),
                        Text('Course: $course'),
                        Text('Skills: $skill'),
                        Text('Preferred Fields: $field'),
                        Text('Year of Study: $year'),
                        Text('Department of Interest: $department'),
                        Text('Gender: $gender'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
