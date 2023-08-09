import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imagePath;

  // ignore: prefer_const_constructors_in_immutables
  ImageViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add an optional close button to exit full-screen view
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Image will fit within the screen
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
