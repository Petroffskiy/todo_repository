import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repositories/feature/presentation%20/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_repositories/feature/presentation%20/screens/main_screen/main_screen.dart';
import 'package:todo_repositories/feature/repository/task_repository.dart';

class MyApp extends StatelessWidget {
  // final HiveInterface hive;
  const MyApp({
    // required this.hive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepository(),
      child: BlocProvider(
        create: (context) =>
            TodoBloc(RepositoryProvider.of<TaskRepository>(context))
              ..add(const GetAllTasks())
              ..add(const ListenTodos()),
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );
  }
}
