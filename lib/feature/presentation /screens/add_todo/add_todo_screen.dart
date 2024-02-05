import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repositories/feature/domain/entities/task.dart';
import 'package:todo_repositories/feature/presentation%20/bloc/todo_bloc/todo_bloc.dart';

class AddTodoScreen extends StatelessWidget {
  final BuildContext context;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddTodoScreen({required this.context, super.key});

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Заголовок:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Введите заголовок',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Описание:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Введите описание',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Создаем объект задачи из введенных данных
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  final Task createdTask = Task(
                    title: _titleController.text,
                    id: Random.secure().nextInt(9999),
                    description: _descriptionController.text,
                  );
                  context.read<TodoBloc>().add(AddTask(task: createdTask));
                  _titleController.clear();
                  _descriptionController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Подтвердить'),
            ),
          ],
        ),
      ),
    );
  }
}
