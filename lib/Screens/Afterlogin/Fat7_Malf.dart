import 'package:flutter/material.dart';
import '../afterlogin.dart';



class Fat7file extends StatefulWidget {
  @override
  _Fat7fileState createState() => _Fat7fileState();
}

class _Fat7fileState extends State<Fat7file> {
  String selectedOption = 'Option 1'; // Initial selected option


  List<String> option1Texts = List.generate(17, (index) {
    switch (index) {
      case 0:
        return 'صفته'; // Change the text at index 0 to 'صفته'
      case 1:
        return 'الرقم المدني'; // Change the text at index 1 to 'الرقم المدني'
      case 2:
        return 'رقم الهاتف'; // Change the text at index 2 to 'رقم الهاتف'
      case 3:
        return 'البريد الالكتروني'; // Change the text at index 3 to 'البريد الالكتروني'
      default:
        return 'Option 1 Text ';
    }
  });

  @override
  Widget build(BuildContext context) {
    List<String> selectedTexts = [];

    switch (selectedOption) {
      case 'Option 1':
        selectedTexts = option1Texts;
        break;

    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => afterlogin()),
              );
            },
            icon: const Icon(Icons.home),
          ),
          title: const Text('فتح ملف'),
          centerTitle: true,
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Text(
                  '   الاسم ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption =
                          newValue ?? 'Option 1'; // Handle null case
                    });
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3']
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add spacing
            Expanded(
              child: SingleChildScrollView( // Use SingleChildScrollView to handle scrolling
                child: DataTable(
                  columns: [
                    const DataColumn(label: Text('البيانات', )),
                    const DataColumn(label: Text('')),
                  ],
                  rows: List<DataRow>.generate(
                    14,
                        (int index) =>
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(selectedTexts[index])),
                            DataCell(Text(selectedTexts[index])),
                          ],
                        ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}