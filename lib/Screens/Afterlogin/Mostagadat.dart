import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen2.dart';



class MyyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black, // Set the primary color to black
        scaffoldBackgroundColor:
            Colors.white, // Set the scaffold background color to white
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add your logout logic here
            },
          ),
        ],
        title:  Text(
          'المستجدات',
            style: GoogleFonts.cairo(fontSize: 24,fontWeight: FontWeight.bold)),


        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
    children:[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(
            width: 2000,
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              // Perform action for button 2
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Set button color to black
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
              ),
            ),
            child: const Text(
              'المستجدات',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
        ],
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
    ]));
  }
}
