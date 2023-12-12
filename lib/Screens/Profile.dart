import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen2.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'John Doe';
  String number = '123456789';
  String email = 'john.doe@example.com';
  String halaty='متفاعل';
  int sessionAttendance = 10;
  int sessionMonab = 10;
  int sessionAseel = 5;

  int expertSessionAttendance = 5;
  int investigationSessionAttendance = 3;
  DateTime? fromDate = DateTime(2023, 8, 1);
  DateTime? toDate = DateTime(2023, 8, 31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:
             Text('الصفحة الشخصية',
                 style: GoogleFonts.cairo(fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: Container(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,

          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '◀  البيانات الشخصية  :',
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              buildInfoRow( '  ●  الاسم:',name),
              buildInfoRow('  ●  رقم الموبيل:', number),
              buildInfoRow('  ●  البريد الالكتروني:', email),
              buildInfoRow('  ●  حالتي:', halaty),

              const SizedBox(height: 20),
              Text(
                '◀  أعمالى :',
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              buildInfoRow('  ●  عدد حضور الجلسات:', sessionAttendance.toString()),
              buildInfoRow('      ≻ اصيل  :', sessionMonab.toString()),
              buildInfoRow('      ≻ مناب   :', sessionAseel.toString()),

              buildInfoRow('  ●  عدد حضور جلسات الخبراء:',
                  expertSessionAttendance.toString()),
              buildInfoRow('  ●  عدد حضور التحقيق:',
                  investigationSessionAttendance.toString()),
              const SizedBox(height: 20),
              Text(
                '◀  التاريخ :',
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: fromDate!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        setState(() {
                          fromDate = selectedDate;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Button background color
                    ),
                    child: Text(
                      fromDate != null
                          ? 'من: ${fromDate!.day}/${fromDate!.month}/${fromDate!.year}'
                          : 'من: اختر التاريخ', // Display selected date or a default text
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: toDate!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        setState(() {
                          toDate = selectedDate;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Button background color
                    ),
                    child: Text(
                      toDate != null
                          ? 'الى: ${toDate!.day}/${toDate!.month}/${toDate!.year}'
                          : 'الى: اختر التاريخ', // Display selected date or a default text
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ],
              ),


        ]),
      ),
    )));
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(width: 10),
          Expanded(
              child: Text(value, style: const TextStyle(color: Colors.black))),

        ],
      ),
    );
  }
}
