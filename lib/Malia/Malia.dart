import 'package:flutter/material.dart';
import 'package:flutter_application_1/Malia/Masaref.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/Screen2.dart';
import 'package:flutter_application_1/Malia/Rossom.dart';

void main() {
  runApp(const MyAppp());
}



class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Page',
      home: ButtonPage(),
    );
  }
}

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool showTextFields = false;
  bool showOfficeExpensesButtons = false;
  bool showFeesButtons = false;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Screen2()),
            );
          },
        ),
        title:  Text('المالية', style: GoogleFonts.cairo(fontSize: 16,fontWeight: FontWeight.bold),),
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
          BackgroundImage(
            showTextFields: showTextFields,
            showOfficeExpensesButtons: showOfficeExpensesButtons,
            showFeesButtons: showFeesButtons,
            onPressedTahseel: () {
              setState(() {
                showTextFields = true;
                showOfficeExpensesButtons = false;
                showFeesButtons = false;
              });
            },
            onPressedExpenses: () {
              setState(() {
                showTextFields = false;
                showOfficeExpensesButtons = true;
                showFeesButtons = false;
              });
            },
            onPressedFees: () {
              setState(() {
                showTextFields = false;
                showOfficeExpensesButtons = false;
                showFeesButtons = true;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Rossomm(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final bool showTextFields;
  final bool showOfficeExpensesButtons;
  final bool showFeesButtons;
  final VoidCallback onPressedTahseel;
  final VoidCallback onPressedExpenses;
  final VoidCallback onPressedFees;

  const BackgroundImage({
    required this.showTextFields,
    required this.showOfficeExpensesButtons,
    required this.showFeesButtons,
    required this.onPressedTahseel,
    required this.onPressedExpenses,
    required this.onPressedFees,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onPressedTahseel,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Text('تحصيل الأموال',
                      style: GoogleFonts.cairo(fontSize: 15,fontWeight: FontWeight.bold),
                  ),),
                   SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Masaref()),
                      );
                    },                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Text('مصاريف المكتب'
                    ,style: GoogleFonts.cairo(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rossomm()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Text('رسوم',
                      style: GoogleFonts.cairo(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            if (showTextFields) ...generateTextFields(),
            if (showOfficeExpensesButtons) ...generateOfficeExpensesButtons(),
          ],
        ),
      ],
    );
  }




List<Widget> generateTextFields() {
    List<String> texts = [
      '  المحصل منه ◀',
      '           صفته  ◀',
      '          تابع ل ◀',
      'المبلغ المحصل◀',
      '  المبلغ المتبقي◀',
      ' طريقة الدفع ◀',
      '    نظام الدفع◀',
      '   عدد الدفعات◀'
    ];

    return texts.map((text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black), // Change border color here
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
              ),

            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          ],
        ),

      );

    }).toList()
      ..add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
            children: [ Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[



              ElevatedButton(
              style: ElevatedButton.styleFrom(

                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),),              onPressed: () {
                // Add your button click logic here
              },
              child: Text('رفع ملف'),
            ),
              SizedBox(width: 40,),
              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(

                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),),
                child: Text('حفظ'),
              ),

            ] ),


            ]),
      ));;

  }

  List<Widget> generateOfficeExpensesButtons() {
    List<String> buttons = [
      'الإيجار',
      'الرواتب',
      'مصاريف مكتبية',
      'اعلانات',
      'صيانة ',
      'مصاريف أخرى',
    ];

    List<Widget> rows = [];
    for (int i = 0; i < buttons.length; i += 3) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons.sublist(i, i + 3).map((button) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your button's onPressed logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                onPrimary: Colors.white,
              ),
              child: Text(button),
            ),
          );
        }).toList(),
      ));
    }

    return rows;
  }




  }

  Widget generateCenterBottomButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle the press of the new center bottom button
          },
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child: Text('New Center Bottom Button'),
        ),
      ),
    );
  }




