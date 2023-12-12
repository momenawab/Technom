import 'package:flutter/material.dart';
import '../Screens/Screen2.dart';

class khesem extends StatefulWidget {
  @override
  _khesemState createState() => _khesemState();
}

class _khesemState extends State<khesem> {
  List<Widget> textFieldsRows = [];

  void addTextFieldRows() {
    List<Widget> rows = [];

    // First row with one TextField
    rows.add(
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: '◄ الاسم',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintMaxLines: 1,
                  alignLabelWithHint: true,
                  hintTextDirection: TextDirection.rtl,
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Add Arabic text between the rows
    rows.add(
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: AlignmentDirectional.centerEnd, // Align text to the right
          child: Text(
            ' بيانات الخصم  ◄   ',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );

    // Second row with three TextFields
    List<Widget> rowTextFields = [];
    for (int i = 0; i < 3; i++) {
      rowTextFields.add(
        const Flexible(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintMaxLines: 1,
                alignLabelWithHint: false,
                hintTextDirection: TextDirection.rtl,
                isDense: true,
              ),
            ),
          ),
        ),
      );
    }
    rows.add(Row(children: rowTextFields));

    setState(() {
      textFieldsRows.addAll(rows);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
        title: const Text('الخصم'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
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
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    ' ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          addTextFieldRows();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black
                        ,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30), // Make the button rounder
                          ),),
                        child: const Text('إضافة الخصم'),

                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: textFieldsRows,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Save button functionality
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(30), // Make the button rounder
                      ),),
                    child: const Text('حفظ'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}
