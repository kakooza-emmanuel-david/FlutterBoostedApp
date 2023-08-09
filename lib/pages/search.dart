// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:david/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/image_viewer.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<String> programmingStacks = [
    "GO lang for web services",
    "C for System development",
    "Kotlin for Desktop and Android",
    "VueJs with HTML, CSS, TypeScript for Front End",
    "PHP with Boosted PHP Library for Web services",
    "Mysql and Redis for cache and Permanent storage",
    // Add more programming stacks here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(titleText: "About us"),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //const SizedBox(height: 20),
              const Text(
                "Who we are and what we stand for?",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
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
                        imagePath: 'assets/images/boosted9.jpg',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/boosted9.jpg',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "We define ourselves as Technology for development specialists that design and implement scalable, sustainable and on demand driven scientific solutions to address simple, moderate and complex challenges in our communities."
                "We were officially incorporated with Uganda Registration Service Bearua on 11TH February 2021 and had our first offices in Buziga. By September 1st 2021, We shifted to our new home in Bwaise along Nabweru Road where we are till date serving our clients diligently and with honor as well managing the design and development of our internal products with love and motivation.",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "We offer Internship training",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
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
                        imagePath: 'assets/images/boosted10.jpg',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/boosted10.jpg',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "The company accepts student interns from various universities including but not limited to Makerere University, Islamic University in Uganda, Kyambogo University among others and engage them in software development trainings, computer hardware designs and development trainings, business management activities among other skill impacting activities which are key factor to our company growth and student interpersonal skill development."
                "it is from the student interns that we retain those who qualify and fit in our objectives.",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "At Boosted Technologies, we use the following programing stacks for Software development;",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: programmingStacks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemBuilder: (context, index) {
                  final stack = programmingStacks[index];
                  return Text(
                    "• $stack",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Contact and basic info",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Categories",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Row(
                // Use Row to place the icon before the text
                children: [
                  Icon(Icons.apps,
                      size: 30, color: Color.fromARGB(95, 0, 0, 0)),
                  SizedBox(width: 5), // Add some spacing between icon and text
                  Text(
                    "Software",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.0,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Contact Info",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Row(
                // Use Row to place the icon before the text
                children: [
                  Icon(Icons.home,
                      size: 30, color: Color.fromARGB(95, 0, 0, 0)),
                  SizedBox(width: 5), // Add some spacing between icon and text
                  Text(
                    "Bwaise along Nabweru Road,Kampala",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.0,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                // Use Row to place the icon before the text
                children: [
                  Icon(Icons.email,
                      size: 30, color: Color.fromARGB(95, 0, 0, 0)),
                  SizedBox(width: 5), // Add some spacing between icon and text
                  Text(
                    "office@boostedtechs.com",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.0,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Website",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () => _launchURL("https://www.boostedtechs.com/"),
                child: const Text(
                  "https://www.boostedtechs.com/",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15.0,
                    color: Colors.blue, // Set the link text color to blue
                    decoration: TextDecoration
                        .underline, // Add underline style to link text
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
