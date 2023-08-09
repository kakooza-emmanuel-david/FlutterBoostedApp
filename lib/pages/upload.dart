import 'package:flutter/material.dart';
import 'package:david/widgets/header.dart';
import 'package:david/widgets/image_viewer.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(titleText: "Services provided"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Wrap the Column with SingleChildScrollView
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 20),
              const Text(
                "We offer computer network installation services at an affordable price.  Call us today and request for the quotes.",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to the full-screen view when the image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewer(
                        imagePath: 'assets/images/boosted1.jpg',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/boosted1.jpg',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We are specialized in mobile / desktop application development. Feel free to  request for a demo from us. Our services are very affordable.  Call us today",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to the full-screen view when the image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewer(
                        imagePath: 'assets/images/boosted2.jpg',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/boosted2.jpg',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you looking for an expert who is specialised in  web development services?? We at Boosted Technologies  got you covered. Call us Today .",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to the full-screen view when the image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewer(
                        imagePath: 'assets/images/boosted3.jpg',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/boosted3.jpg',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Hey..\n"
                "Meet our young innovators team of interns who will be part of us for some months. You can also apply for internship with us on this app. .",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Use GridView to display images in a 2x2 grid
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0, // Separation between columns
                mainAxisSpacing: 10.0, // Separation between rows
                shrinkWrap: true,
                // ignore: prefer_const_constructors
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the full-screen view when the image is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imagePath: 'assets/images/boosted4.jpg',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/boosted4.jpg',
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      height: MediaQuery.of(context).size.width / 2 - 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the full-screen view when the image is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imagePath: 'assets/images/boosted5.jpg',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/boosted5.jpg',
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      height: MediaQuery.of(context).size.width / 2 - 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the full-screen view when the image is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imagePath: 'assets/images/boosted6.jpg',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/boosted6.jpg',
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      height: MediaQuery.of(context).size.width / 2 - 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the full-screen view when the image is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imagePath: 'assets/images/boosted7.jpg',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/boosted7.jpg',
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      height: MediaQuery.of(context).size.width / 2 - 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
