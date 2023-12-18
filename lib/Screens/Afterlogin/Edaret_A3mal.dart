import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/Screens/Afterlogin/tar7el2.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_1/login.dart';


void main() {
  runApp(Screen2_1());
}

class Screen2_1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إدارة العمل',

      debugShowCheckedModeBanner: false,
      home: ButtonPage(),
    );
  }
}

class ButtonPage extends StatelessWidget {
  void _logout(BuildContext context) {
    // Add your logout logic here
    // For example, you can navigate to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginApp()), // Replace with your login page
    );
  }

  Widget _iconButton(BuildContext context, String text, Widget destination,
      IconData iconData) {
    double fontSize = text == 'الاجراءات الادارية'
        ? 12
        : 14; // Adjust the font size as needed (changed 16 to 14)
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        width: 110,
        height: 115,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('img/buttonwall.jpg'), // Add your image path
            fit: BoxFit.cover,

          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 40, // Adjust the size as needed
            ),
            const SizedBox(height: 10), // Adjust the spacing as needed
            Text(
              text,
              style: GoogleFonts.amiri(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:  Text(
          'إدارة العمل ',
          style: GoogleFonts.cairo(fontSize: 24,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.logout), // Add your logout icon here
          onPressed: () {
            _logout(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your notification logic here
            },
            icon: const Icon(Icons.notifications),
          ),

        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _iconButton(
                        context,
                        'فتح ملف',
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                            if (result != null) {
                              print('File path: ${result.files.single.path}');
                            } else {
                              print('File picking canceled');
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50,
                            child: Center(
                              child: Icon(
                                Icons.upload_file,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Icons.upload_file,
                      ),
                      const SizedBox(width: 20),
                      _iconButton(context, 'ترحيل العمل', mangement2(),
                          Icons.business_center),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 110,
            child: Image.asset(
              'img/logo.png',
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
