import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Afterlogin/Edaret_A3mal.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen2.dart';


class mangement extends StatelessWidget {
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
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }




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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }

                      // Show the time picker
                      await _selectTime(context);
                    },
                    child: Text('اختر التاريخ والوقت'),
                  ),

                    SizedBox(width: 20,),

                    ElevatedButton(

                    onPressed: (){},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),),
                    child:
                Text('حفظ',)

                ),
                    SizedBox(width: 20,),
                    ElevatedButton(

                        onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),),
                        child:
                        Text('رفع ملف',)

                    )
              ],
            ),
              if (_selectedDate != null) Text(" التاريخ: ${_selectedDate.toString().split(' ')[0]} ",
    textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

          ]),
          )],


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
