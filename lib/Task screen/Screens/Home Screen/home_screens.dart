import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Task screen/Screens/Add%20Task/add_task.dart';
import 'package:flutter_application_1/Task screen/Screens/taskItem.dart';
import 'package:flutter_application_1/Task screen/cubit/app_cubit.dart';
import 'package:flutter_application_1/Task screen/data/database.dart';
import 'package:flutter_application_1/Screens/afterlogin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get maxLines async => readMore? 10 : 2;

  get readMore => null;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => afterlogin()),
                );
              },
            ),
            title: const Text(
              'مواعيدي',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          backgroundColor: Colors.grey[300],
          body: state is GetDataLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.blue,
                                value: cubit.Todo[index].finish,
                                onChanged: (value) {
                                  cubit.changeFinish(
                                      index: index, value: value!
                                  );
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.Todo[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      decoration: cubit.Todo[index].finish
                                          ? TextDecoration.lineThrough
                                          : null,
                                      decorationThickness: 2,
                                    ),
                                  ),

                                  Text(
                                    cubit.Todo[index].description,

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      decoration: cubit.Todo[index].finish
                                          ? TextDecoration.lineThrough
                                          : null,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 8,),

                                  Row(
                                    children: [
                                      Text(
                                        cubit.Todo[index].date,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(
                                        cubit.Todo[index].time,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () async {
                                  await MyDatabase.deleteRowFromDatabase(
                                      id: cubit.Todo[index].id);
                                  cubit.getData();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.Todo.length,
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddScreen(),
                ),
              );
              // await  MyDatabase.insertToDatabase(title: 'Work 2', des: 'work on application2', date: '20/8/2023', time: '8 AM', finish: 0);
              // cubit.getData();
            },
          ),
        );
      },
    );
  }

  void setState(Null Function() param0) {}
}
