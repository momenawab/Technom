import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen2.dart';

void main() {
  runApp(ButtonApp());
}

class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الجلسات',
      home: ButtonPage(),
    );
  }
}

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  Map<String, bool> checkboxValues = {
    'أجل الاعلان': false,
    'أجل للاعلان مع إرشاد': false,
    'أجل الإعلان لمواجهة نيابة': false,
    'أجل للإعلان بجهة العمل': false,
    'طلب إعلان أصل الصحيفة': false,
    'أجل لضم الملف': false,
    'أجل لضم المفردات': false,
    'أجل لسماع الشهود': false,
    'أجل لاستكمال الدفوع': false,
    'أجل لاستكمال المستندات': false,
    'تصريح معلومات مدنية': false,
    'تصريح مستخرج من وزارة التجارة': false,
    'تصريح استخراج شهادة راتب من جهة عملة': false,
    'تم تقديم مذكرة': false,
    'ترصيح استخراج شهادة راتب من جهة التامينات الاجتماعية': false,
    'تم تقديم حافظة مستندات': false,
    'تم تقديم صحيفة ادخال': false,
    'تم مستندات غير مفرزة': false,
    'تم تقديم مرفقات الكترونية': false,
    'تم تقديم وصل رسوم': false,
    'تم تقديم صحيفة تعديل طلبات': false,
    'تم طلب ضم ملف': false,
    'محجوزة للحكم': false,
    'محجوزة للحكم مع تبادل مذكرات خالل اسبوع': false,
    'مذكرات خلال اسبوعين': false,
    'محجوزة للحكم مع مذكرات': false,
    'اخرى': false,

  };

  AppBar buildCustomNavBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen2()),
          );
        },
        icon: Icon(Icons.home),
      ),
      title: const Text('الجلسات'),
      centerTitle: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: buildCustomNavBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "معلومات عن الجلسة",
                        style: GoogleFonts.amiri(
                          textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        textAlign: TextAlign.right,
                      ),

                      for (var title in checkboxValues.keys)
                        buildCheckbox(title),
                      const SizedBox(height: 10),
                      Container(
                        width: 250,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.right,  // This aligns the text to the right

                          decoration: const InputDecoration(
                            hintText: '.....إضافة ملاحظة',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('رفع ملف'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('حفظ'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
        ]),
              ),
            ),
            ) ],
        ),
      ),
    );
  }

  Widget buildCheckbox(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          checkboxValues[title] = !checkboxValues[title]!;
        });
      },
      child: CheckboxListTile(
        title: RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: title + " ◀ ",
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: checkboxValues[title]! ? Colors.blue.shade300 : Colors.black, // Change text color when checked
              ),
            ),
          ),
        ),
        value: checkboxValues[title],
        onChanged: (bool? value) {
          setState(() {
            checkboxValues[title] = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.black,
      ),
    );
  }
}

