import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Afterlogin/Mostagadat.dart';

import 'package:flutter_application_1/Screens/Afterlogin/Edaret_A3mal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen2.dart';
import '../main.dart';
import 'Afterlogin/Fat7_Malf.dart';
import 'package:flutter_application_1/Task screen/mainn.dart';
import 'package:flutter_application_1/login.dart';




class afterlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Styled Page',
      home: StyledPage(),
    );
  }
}

class StyledPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'اختيار الخدمة',
              style: GoogleFonts.cairo(fontSize: 24,fontWeight: FontWeight.bold)),

          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add your logout logic here
              // For example, you can clear user credentials and navigate to the login screen.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginApp()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children :[
              Expanded(


             child : Container(
               margin: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), // Add this line for border radius

                  image: const DecorationImage(
                    image: AssetImage('img/newback.png'),
                    fit: BoxFit.fill,

                  ),
                ),

              ),),

              Center(
                child: Column(
                  children: [

                    const SizedBox(height: 1),
                    ElevatedButton(
                      onPressed: () {
                        _showTextFieldPopup(context);

                        // Add your logic for the first button here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),// Button background color
                      ),
                      child: Text(
                        'ادخال كود القضية',
                        style: GoogleFonts.amiri(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ), // Text color
                      ),
                    )),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {

                        // Add your logic for the second button here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),// Button background color
                      ),
                      child: Text(
                        'QR مسح رمز ',
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ), // Text color
                        ), // Text color
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to Screen2.dart when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Screen2_1()), // Replace with the desired destination
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),// Button background color
                      ),
                      child: Text(
                        'ادارة العمل',
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ), // Text color
                        ),                      ),
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Fat7file()), // Replace with the desired destination
                        );
                        // Navigate to Screen2.dart when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),// Button background color
                      ),
                      child: Text(
                        'فتح ملف',
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ), // Text color
                        ),                      ),
                    ),            const SizedBox(height: 20),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        ElevatedButton(
                        onPressed: () {
                        // Add your button 2 action here
                        },
                        style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        ),
                        child: Container(
                        width: 90,
                        height: 90,
                        alignment: Alignment.center,
                        child: Image.asset(
                        'img/library.png', // Replace with your image path
                        width: 120,
                        height: 120,))),
                        ElevatedButton(
                         onPressed: () {
                        // Navigate to Screen2.dart when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TaskSc()), // Replace with the desired destination
                        );},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),// Button background color
                      ),
                      child: Text(
                        'مواعيدي',
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ), // Text color
                        ),                      ),
                    ),
                    const SizedBox(height:0),
                        ElevatedButton(
                          onPressed: () {
                            // Add your button 1 action here
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: Container(
                            width: 90,
                            height: 90,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'img/Chatgpt.png', // Replace with your image path
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                  ],
                ),

    ])),

              const Column(

                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Soon....',style: TextStyle(fontSize: 19 ,fontWeight: FontWeight.bold),)
                    ,



                    SizedBox(height: 6),


                  ],

                ),



            ]));
  }
  void _showTextFieldPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ادخل رقم القضية'),
          content: TextField(
            controller: _textFieldController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: const InputDecoration(
              hintText: '........',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                final enteredNumber = _textFieldController.text.trim();
                if (enteredNumber.isNotEmpty) {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(enteredNumber: enteredNumber),
                    ),
                  );
                } else {
                  // Show an error message or handle invalid input
                }
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}


// Include your LoginPage and other necessary code here.
