import 'package:flutter/material.dart';
import '../Galasat_5obara2/Add_5esm.dart';
import '../Screens/Screen2.dart';

void main() {
  runApp(galasat());
}

class galasat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _showTextField = false;
  String? _selectedDropdownValue;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();


  void _onButtonPressed() {
    setState(() {
      _showTextField = !_showTextField; // Toggle the visibility of the text field
    });
  }
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


  Widget _buildContent() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            '  ◀  عن الموكل',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionButton('تم تقديم مذكرة', () {}),
                const SizedBox(width: 10),
                OptionButton('اجل الاعلان مع ارشاد ', () {}),
                const SizedBox(width: 10),
                OptionButton('اجل الاعلان', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionButton('طلبنا اجل للرد', () {}),
                const SizedBox(width: 10),
                OptionButton('تم تقديم حافظة مستندات', () {}),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20), // Added spacing
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => khesem()),);
                  // Add your button's onPressed logic here
                  // Add your button's onPressed function
                },                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Make the button rounder
                  ),
                ),
                child: const Text(
                  'اضافة الخصم',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              ElevatedButton(onPressed: _onButtonPressed,

                child: const Text('اضافة قرار ',
                ),

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Make the button rounder
                    ),)),
              if (_showTextField)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // Added spacing
                    DropdownButton<String>(
                      value: _selectedDropdownValue,
                      hint: const Text("اختر القرار",style: TextStyle(fontWeight: FontWeight.bold),),
                      items: <String>['جلسة للمناقشة', 'جلسة للمعاينة', 'محجوزة للتقرير']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDropdownValue = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20), // Added spacing
                    const Text(
                      "ملاحظة:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(29.9),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Align the button to the right
                      children: [
                        if (_showTextField)
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

                      ],

                    ),
                    if (_selectedDate != null) Text("التاريخ: ${_selectedDate.toString().split(' ')[0]}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Center(

                     child: Row(children:[
                       SizedBox(width: 157,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),),
                      onPressed: () {
                        // Call the function to show the date picker
                      },
                      child: const Text("رفع ملف "),
                    ),]))
                  ],


                ),

            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
          },
        ),
        title: const Text('جلسات الخبراء'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: _buildContent(),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onSpecialButtonPressed; // Added this for special buttons

  OptionButton(this.text, this.onPressed, {this.onSpecialButtonPressed});

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected; // Toggle the selection state
        });
        widget.onPressed();
        if (widget.onSpecialButtonPressed != null &&
            (widget.text == 'جلسة للمناقشة' ||
                widget.text == 'جلسة للمعاينة' ||
                widget.text == 'محجوزة للتقرير')) {
          widget.onSpecialButtonPressed!(); // Invoke for special buttons
        }
      },
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.grey : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Make the button rounder
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
