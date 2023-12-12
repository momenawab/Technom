import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Task screen/Screens/Home%20Screen/home_screens.dart';
import 'package:flutter_application_1/Task screen/cubit/app_cubit.dart';
import 'package:flutter_application_1/Task screen/data/database.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await MyDatabase.initializeDatabase();

  runApp(TaskSc());
}
bool isReadMore = false;


class TaskSc extends StatelessWidget {
  const TaskSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}







