import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen2.dart';

void main() {
  runApp(Mange());
}


class Mange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Procedures',
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String selectedProcedure = 'خارجيات';
  String selectedProcedureText = '';
  List<String> procedureOptions = [
    'خارجيات',
    'استعلام',
    'اعمال ادارية',
    'إجراءات تنفيذ',
  ];
  String selectedActionButton = '';
  Map<String, String> procedureTextMap = {
    'خارجيات': 'خارجيات',
    'استعلام': 'استعلام',
    'اعمال ادارية': 'اعمال ادارية',
    'إجراءات تنفيذ': 'إجراءات تنفيذ',
  };

  Map<String, bool> buttonSelections = {
    'مراجعة مخافر': false,
    'مراجعة نيابة عامة': false,
    'مراجعة جهات حكومية': false,
    'اجتماع اعمال اخري': false,
  };
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
        backgroundColor: Colors.black,
        title:  Text(
          'إجراءات ادارية',
            style: GoogleFonts.cairo(fontSize: 24,
                fontWeight: FontWeight.bold)),


        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Stack(
        children: [
          /*Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),*/
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1, // Only one item in the list
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Text(
                          '  : نوع الاجراء  ◀ ',
                            style: GoogleFonts.amiri(
                             textStyle: const TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                        ),
                        ),),
                        DropdownButton<String>(
                          value: selectedProcedure,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedProcedure = newValue!;
                              selectedProcedureText = procedureTextMap[newValue]!;
                            });
                          },
                          items: procedureOptions.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: const TextStyle(color: Colors.black)),
                              );
                            },
                          ).toList(),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '',                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildActionButton('مراجعة النيابة العامة'),

                            buildActionButton('مراجعة جهات حكومية'),
                            const SizedBox(width: 0),


                          ],
                        ),Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildActionButton('مراجعة مخافر'),
                            buildActionButton(' اجتماع '),

                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildActionButton(' اعمال اخري'),


                          ],
                        )
                      ],
                    ),
                         Text(': مكان العمل ◀ ',style: GoogleFonts.amiri(
                           textStyle: const TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                           ), )),
                        Container(

                          width: 350,
                          padding: const EdgeInsets.only(right: 20), // Adjust the left padding

                          child: TextFormField(

                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.right, // Align the text inside the TextField to the right

                            decoration: const InputDecoration(
                              hintText: '',

                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),

                            ),
                          ),

                        ),
                         const SizedBox(height: 10,),
                        Text(': نوع العمل ◀ ',style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ), )),
                        Container(

                          width: 350,
                          padding: const EdgeInsets.only(right: 20), // Adjust the left padding

                          child: TextFormField(

                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.right, // Align the text inside the TextField to the right

                            decoration: const InputDecoration(
                              hintText: '',

                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),

                            ),
                          ),

                        ),
                        const SizedBox(height: 10,),

                         Text(
                          ':  ملاحظة  ◀ ',
                          style: GoogleFonts.amiri(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        )),
                        const SizedBox(height: 10),
                        Container(

                          width: 350,
                          padding: const EdgeInsets.only(right: 20), // Adjust the left padding

                          child: TextFormField(
                            maxLines: 5,
                            maxLength: 125,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.right, // Align the text inside the TextField to the right

                            decoration: const InputDecoration(
                              hintText: '...أدخل ملاحظتك',

                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),

                            ),
                          ),

                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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

                          ]),
                      if (_selectedDate != null) Text("التاريخ: ${_selectedDate.toString().split(' ')[0]}", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),



                        // Add a date picker for end date


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            ElevatedButton(
                              onPressed: () {},

                              style: ElevatedButton.styleFrom(

                                primary: Colors.black,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              ),),

                              child: const Text('رفع مستند'),
                            ),
                            const SizedBox(width: 20,),
                            ElevatedButton(
                              onPressed: () {},

                              style: ElevatedButton.styleFrom(

                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),),
                              child: const Text('حفظ'),

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );

  }

  Widget buildActionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            buttonSelections[title] = !buttonSelections[title]!;
            selectedActionButton = title;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: buttonSelections[title] == true ? Colors.grey : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}





