import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Screen2.1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen2.dart';
void main() {
  runApp(mangement3());
}

class mangement3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen2()),
              );
            },
          ),
          title: Text('ترحيل العمل',
              style: GoogleFonts.cairo(fontSize: 24,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black, // Set the background color to transparent
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),// Remove elevation
        ),
        body: Container(


          child: Padding(
            padding: EdgeInsets.only(top: 150, left: 20, right: 20), // Adjust top padding as needed
            child: ButtonRow(),
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  List<Widget> rows = [];
  List<bool> isSelected = [false, false, false, false, false, false, false];
  TextEditingController customTextController = TextEditingController();
  bool showCustomButton = false; // Track if the custom button should be shown
  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _a3malmongaza(0),
                style: _getButtonStyle(isSelected[0]),
                child: Text('الأعمال المنجزة'),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(1),
                style: _getButtonStyle(isSelected[1]),
                child: Text('الترحيل'),
              ),

            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(2),
                style: _getButtonStyle(isSelected[2]),
                child: Text('تقرير الإسبوع'),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(3),
                style: _getButtonStyle(isSelected[3]),
                child: Text('اعمال لم تنجز'),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(4),
                style: _getButtonStyle(isSelected[4]),
                child: Text('تقرير الاسبوع القادم '),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(5),
                style: _getButtonStyle(isSelected[5]),
                child: Text('التقرير الشهري والسنوي'),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _handleButtonPress(6),
                style: _getButtonStyle(isSelected[6]),
                child: Text('توزيع العمل'),
              ),
            ),
            SizedBox(width: 0),


          ],
        ),
        SizedBox(height: 50), // Adding some space between buttons and text fields
        Column(
          children: rows,
        ),
        if (showCustomButton)
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle the custom button press here
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('حفظ'),
                ),
              ],
            ),
          ),
      ],


    );

  }

  void _handleButtonPress(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        if (i == index) {
          isSelected[i] = !isSelected[i];
        } else {
          isSelected[i] = false;
        }
      }

      if (isSelected[index]) {


        rows.clear();
        rows.add(createRow('        : الجلسات',));
        rows.add(createRow(':الاعمال الادارية'));
        rows.add(SizedBox(height: 10)); // Adding space between text fields
        rows.add(createRow('      : الخارجيات'));
        rows.add(createRow('           : التنفيذ'));
        showCustomButton = true; // Show the custom button


      } else {
        rows.clear();
        showCustomButton = false; // Hide the custom button

      }
      Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Align content to the right
        children: rows,
      );
    });
  }
  void _a3malmongaza(int index) {
    setState(() {      isTextVisible = !isTextVisible;
    });}




  ButtonStyle _getButtonStyle(bool selected) {
    return ElevatedButton.styleFrom(
      backgroundColor: selected ? Colors.black26 : Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );

  }

  Widget createRow(String labelText) {
    return Padding(
      padding: EdgeInsets.only(top: 10), // Move text and text field down
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align the row to the right
        children: [
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Set focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Set enabled border color
                  ),
                ),
              ),
              child: TextField(
                scrollPadding: const EdgeInsets.only(right: 20), // Adjust the left padding
                decoration: InputDecoration(
                  // You can leave this empty since the theme defines the borders
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            labelText,
            textAlign: TextAlign.right, // Align the text to the right
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              // Default to black if no color is provided
            ),
          ),
          if (isTextVisible)
            Text(
              'Text Appears Here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

}
