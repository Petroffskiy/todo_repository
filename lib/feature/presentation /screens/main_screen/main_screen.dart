import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repositories/feature/presentation%20/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_repositories/feature/presentation%20/screens/add_todo/add_todo_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo main")),
      body: Stack(
        children: [
          Center(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state.todo.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.todo.length,
                    itemBuilder: (context, index) {
                      final todo = state.todo[index];
                      return ListTile(
                        title: Text(todo.title),
                        leading: Checkbox(
                          value: todo.isComplete,
                          onChanged: (value) {
                            context
                                .read<TodoBloc>()
                                .add(ChangeCompleteTask(id: todo.id));
                            print("todos complete: ${todo.isComplete}");
                            
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(DeleteTask(id: todo.id));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Empty todo'),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTodoScreen(
                          context: context,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
