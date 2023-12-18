import 'package:flutter/material.dart';
import '../Screen2.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: const Text(
          'تحقيق',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),

      body: const BackgroundImage(),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ' ما هو نوع التحقيق؟',
          style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        OptionsList(),
      ],
    );
  }
}

class OptionsList extends StatefulWidget {
  const OptionsList({super.key});


  @override
  _OptionsListState createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  String selectedOption = '';
  List<String> selectedOptions = [];
  bool isOptionSelected = false;
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
            OptionButton('لدى الادارة العامة للتحقيقات', () {
              toggleOption('Option 1');
            }, isSelected: selectedOption == 'Option 1'),
            const SizedBox(width: 10),
            OptionButton('لدى النيابة العامة', () {
              toggleOption('Option 2');
            }, isSelected: selectedOption == 'Option 2'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton('لدى جهة اخرى', () {
              toggleOption('Option 3');
            }, isSelected: selectedOption == 'Option 3'),
            const SizedBox(width: 10),
            OptionButton('لدى وزارة الشئون', () {
              toggleOption('Option 4');
            }, isSelected: selectedOption == 'Option 4'),
          ],
        ),
        if (selectedOption.isNotEmpty) ...generateTextFields(),
        Visibility( // Center bottom button with conditional visibility
          visible: isOptionSelected,
          child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             ElevatedButton(
              onPressed: () {
                // Handle the press of the center bottom button
              },
              style: ElevatedButton.styleFrom(primary: Colors.black
              ,shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20), // Adjust the radius as needed
                ),
                ),
            child: const Text('رفع ملف'),

            ),


                ElevatedButton(
              onPressed: () {
                // Handle the press of the center bottom button
              },
              style: ElevatedButton.styleFrom(primary: Colors.black
                ,shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
                ),
              ),
              child: const Text('حفظ'),

            ),
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
            ]),

    ),
        if (_selectedDate != null) Text("التاريخ: ${_selectedDate.toString().split(' ')[0]}", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

      ],
    );
  }

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
        selectedOption = '';
        isOptionSelected = false;
      } else {
        selectedOptions.clear();
        selectedOptions.add(option);
        selectedOption = option;
        isOptionSelected = true;
      }
    });
  }

  List<Widget> generateTextFields() {
    List<String> texts = ['تاريخ التحقيق   ◂', ' وقت التحقيق   ◂', ' مكان التحقيق   ◂', '   اسم المحقق   ◂', '   رقم الشكوي   ◂', '    رقم القضية   ◂', '         رقم أخر   ◂','         ملاحظة   ◂'];

    return texts.map((text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: Row(
              children: [
                SizedBox(width: 5),
                Expanded(

                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green), // Set the border color to white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    )).toList();
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const OptionButton(this.text, this.onPressed, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
        style: ButtonStyle(
        backgroundColor: isSelected ? MaterialStateProperty.all<Color>(Colors.black12) : MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),)
      ),),


      child: Text(text),);

  }
}
