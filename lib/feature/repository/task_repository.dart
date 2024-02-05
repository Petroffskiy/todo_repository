import 'dart:async';

import 'package:todo_repositories/feature/domain/entities/task.dart';
import 'package:todo_repositories/feature/interface/i_task_repository.dart';

class TaskRepository extends ITaskRepository {
  final List<Task> tasks = [];

  TaskRepository();

  @override
  void addTask({required Task task}) {
    tasks.add(task);
  }

  @override
  void deleteTask({required int id}) {
    final Task removedTask = tasks.firstWhere((element) => element.id == id);
    tasks.remove(removedTask);
  }

  @override
  List<Task> getAllTasks() {
    return tasks;
  }

  @override
  bool changeCompleteTask({required int id}) {
    final Task task = tasks.firstWhere((element) => element.id == id);
    print('repository in map before change: $task ');

    final int i = tasks.indexOf(task);
    tasks.removeAt(i);
    task.isComplete = !task.isComplete;
    tasks.insert(i, task);

    print('task repository: $task ');
    return task.isComplete;
  }

  @override
  Stream<List<Task>> listenTask() {
    final StreamController<List<Task>> listenTask;
    listenTask = StreamController.broadcast();
    listenTask.add(tasks);
    return listenTask.stream;
  }
}
