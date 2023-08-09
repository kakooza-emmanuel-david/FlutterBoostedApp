// ignore_for_file: unused_local_variable
//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:david/widgets/header.dart';
import 'package:david/widgets/success_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:david/widgets/success_page.dart';
import '../widgets/progress.dart';
//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server.dart';
//import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum Year { Year1, Year2, Year3, Year4 }

// ignore: constant_identifier_names
enum Department { MarketingDepartment, ITDepartment, Administration }

// ignore: constant_identifier_names
enum Gender { Male, Female }

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var emailText = TextEditingController();
  var nameText = TextEditingController();
  var phoneNumber = TextEditingController();
  var uniText = TextEditingController();
  var courseText = TextEditingController();
  var skillText = TextEditingController();
  var fieldText = TextEditingController();

  // ignore: unused_field
  Year? _year;
  // ignore: unused_field
  Department? _department;
  // ignore: unused_field
  Gender? _gender;

  bool validateFields() {
    if (nameText.text.isEmpty ||
        emailText.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        uniText.text.isEmpty ||
        courseText.text.isEmpty ||
        skillText.text.isEmpty ||
        fieldText.text.isEmpty ||
        _year == null ||
        _department == null ||
        _gender == null) {
      return false;
    }
    return true;
  }

  void _resetFields() {
    nameText.clear();
    emailText.clear();
    phoneNumber.clear();
    uniText.clear();
    courseText.clear();
    skillText.clear();
    fieldText.clear();
    setState(() {
      _year = null;
      _department = null;
      _gender = null;
      _errorMessage = ''; // Clear the error message when resetting fields
    });
  }

  @override
  void initState() {
    super.initState();
    _resetFields();
  }

  bool _isRefreshing = false;
  // ignore: unused_field
  String _errorMessage = '';

  // Function to handle the refresh action
  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
      _errorMessage = ''; // Clear the error message when refreshing
    });

    // Simulate some async work here (e.g., clearing fields, fetching new data, etc.)
    await Future.delayed(const Duration(seconds: 2));

    _resetFields();

    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(isAppTitle: true),
      // ignore: sized_box_for_whitespace
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Align(
          alignment: Alignment.topLeft,
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Our internship programs are designed for students enrolled for Information Technology related programs at University or related higher institutions of learning.\n"
                      "We are so much honoured to have you take interest in having internship with us. "
                      "The Boosted internship programs all run for 2 - 3 months with attendance of a maximum of three days a week.\n"
                      "The interns receive training and we ensure they get hands on skills by appropriating supervised real time projects to them.\n"
                      "At the end of the programs, Certificates are issued out and our interns will win them selves Two certificates i.e Boosted Technologies LTD's certificate and Silicon Savannah LTD's certificate.\n"
                      "Requirements for internship placement.\n"
                      " \t-A university or Tertiary institute student undergraduate student seeking for industrial training skills.\n"
                      " \t-An Internship University / Tertiary Letter\n"
                      " \t-A laptop / Computer (Optional)\n\n"
                      "This is application is not a guarantee that the internship placement will be offered."
                      "We go through shortlisting to ensure we have the right people to be part of our innovation Hub at Boosted Technologies LTD",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Application form',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 20),

                    //name
                    TextField(
                      controller: nameText,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Name",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.person,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),
                    // const SizedBox(height: 10),

                    //Email
                    TextField(
                      controller: emailText,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Email",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.email,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //phone
                    TextField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Telephone Number",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.phone,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //university
                    TextField(
                      controller: uniText,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "University",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.school,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //course
                    TextField(
                      controller: courseText,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Course",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.book,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //Preferred fields
                    TextField(
                      controller: fieldText,
                      keyboardType:
                          TextInputType.multiline, // Enable multiline input
                      maxLines:
                          null, // Allow the text field to expand to multiple lines
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Preferred fields",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.thumb_up,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //Skills
                    TextField(
                      controller: skillText,
                      keyboardType:
                          TextInputType.multiline, // Enable multiline input
                      maxLines:
                          null, // Allow the text field to expand to multiple lines
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        enabledBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        // ignore: prefer_const_constructors
                        focusedBorder: UnderlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide:
                              // ignore: prefer_const_constructors
                              BorderSide(
                                  color: const Color.fromARGB(146, 255, 153, 0),
                                  width: 2),
                        ),
                        hintText: "Skills",
                        suffixIcon: IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.star_border,
                            color: const Color.fromARGB(146, 255, 153, 0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),

                    //Year of study
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Year Of Study:',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Year>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Year.Year1,
                      groupValue: _year,
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      tileColor: Colors.orange.shade50,
                      title: Text(Year.Year1.name),
                      onChanged: (val) {
                        setState(() {
                          _year = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Year>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Year.Year2,
                      groupValue: _year,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Year.Year2.name),
                      onChanged: (val) {
                        setState(() {
                          _year = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Year>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Year.Year3,
                      groupValue: _year,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Year.Year3.name),
                      onChanged: (val) {
                        setState(() {
                          _year = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Year>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Year.Year4,
                      groupValue: _year,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Year.Year4.name),
                      onChanged: (val) {
                        setState(() {
                          _year = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //Choose department of interest
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose department of interest:',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Department>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Department.MarketingDepartment,
                      groupValue: _department,
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      tileColor: Colors.orange.shade50,
                      title: Text(Department.MarketingDepartment.name),
                      onChanged: (v) {
                        setState(() {
                          _department = v;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Department>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Department.ITDepartment,
                      groupValue: _department,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Department.ITDepartment.name),
                      onChanged: (v) {
                        setState(() {
                          _department = v;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Department>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Department.Administration,
                      groupValue: _department,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Department.Administration.name),
                      onChanged: (v) {
                        setState(() {
                          _department = v;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //Gender
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender:',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Gender>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Male,
                      groupValue: _gender,
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      tileColor: Colors.orange.shade50,
                      title: Text(Gender.Male.name),
                      onChanged: (gen) {
                        setState(() {
                          _gender = gen;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // ignore: prefer_const_constructors
                    RadioListTile<Gender>(
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Female,
                      groupValue: _gender,
                      dense: true,
                      tileColor: Colors.orange.shade50,
                      title: Text(Gender.Female.name),
                      onChanged: (gen) {
                        setState(() {
                          _gender = gen;
                        });
                      },
                    ),

                    // Show circular progress indicator while refreshing
                    if (_isRefreshing) circularProgress(),

                    ElevatedButton(
                      onPressed: () async {
                        if (validateFields()) {
                          String uName = nameText.text.toString();
                          String uEmail = emailText.text.toString();
                          int uPhone = int.parse(phoneNumber.text);
                          String uUni = uniText.text.toString();
                          String uCourse = courseText.text.toString();
                          String uSkill = skillText.text.toString();
                          String uField = fieldText.text.toString();
                          String selectedYear =
                              _year != null ? _year!.name : "Not selected";
                          String selectedDepartment = _department != null
                              ? _department!.name
                              : "Not selected";
                          String selectedGender =
                              _gender != null ? _gender!.name : "Not selected";

                          // Check if the email already exists in Firestore
                          final emailExists = await _checkEmailExists(uEmail);
                          if (emailExists) {
                            setState(() {
                              _errorMessage = 'User already applied.';
                            });

                            // Show a SnackBar notification for a short duration
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              // ignore: prefer_const_constructors
                              SnackBar(
                                content: const Text('User already applied.'),
                                duration: const Duration(seconds: 4),
                              ),
                            );
                          } else {
                            // Store data in Cloud Firestore
                            await FirebaseFirestore.instance
                                .collection('internship_applications')
                                .add({
                              //'userId': userId,
                              'name': uName,
                              'email': uEmail,
                              'phone': uPhone,
                              'university': uUni,
                              'course': uCourse,
                              'skill': uSkill,
                              'field': uField,
                              'year': selectedYear,
                              'department': selectedDepartment,
                              'gender': selectedGender,
                              'timestamp': FieldValue
                                  .serverTimestamp(), // Optional: Include timestamp
                            });

                            // Send email using user's provided email
                            //await sendEmailToServer();

                            // ignore: avoid_print
                            print(
                                "Name: $uName,Email: $uEmail,telephoneNumber: $uPhone,University: $uUni,Course: $uCourse,Skill: $uSkill,preferredSkills: $uField,Year of Study: $selectedYear,departmentOfInterest: $selectedDepartment,Gender: $selectedGender");
                            //}
                            // Clear all fields before navigating to SuccessPage
                            //resetFields();
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              // ignore: prefer_const_constructors
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => SuccessPage()),
                            ).then((_) {
                              // This callback will be called when the SuccessPage is popped
                              _resetFields();
                            });
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // ignore: prefer_const_constructors
                                title: Text("Warning"),
                                // ignore: prefer_const_constructors
                                content: Text(
                                    "Please fill in all fields and select options from all lists."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    // ignore: prefer_const_constructors
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      // ignore: prefer_const_constructors
                      child: Text('Submit'),
                    ),

                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _checkEmailExists(String enteredEmail) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('internship_applications')
          .where('email', isEqualTo: enteredEmail)
          .limit(1)
          .get();

      return snapshot.size > 0;
    } catch (error) {
      // ignore: avoid_print
      print('Error checking email: $error');
      return false;
    }
  }
}
