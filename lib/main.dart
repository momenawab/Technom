import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/Screen2.dart';
import 'login.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo at the top center
            Image.asset('img/logo.png', width: 300, height: 300), // Replace with your logo
            SizedBox(height: 50),
            // Text in the middle
            Text(
              "اهلا بك في تطبيق تكنوم للمحاماة",
              style: GoogleFonts.amiri(fontSize: 24,fontWeight: FontWeight.bold,)
            ),
            SizedBox(height: 20),
            // Button under the text
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginApp()),
              );
                // Add your button functionality here
              },
              child: Text("   تسجيل الدخول   "
              ,              style: GoogleFonts.amiri(fontSize: 18,fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
