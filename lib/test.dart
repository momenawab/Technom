import 'package:flutter/material.dart';
void main() {
  runApp(DropdownPage());
}
class DropdownPage extends StatefulWidget {
  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String selectedOption = "صفته"; // Initial option

  List<String> options = [
    "صفته",
    "الرقم المدني",
    "رقم الهاتف",
    "البريد الإلكتروني",
    "موضوع القضية",
    "رقم القضية",
    "الرقم الألي",
    "اسم الخصم",
    "صفته",
    "اسم اقرب شخص لك",
    "رقم الهاتف",
    "صلة القرابة",
    "تابع للمحامي",
    "بيانات اخري",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Option: $selectedOption",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
