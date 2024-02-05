import 'package:todo_repositories/feature/domain/entities/task.dart';

abstract class ITaskRepository {
  List<Task> getAllTasks();

  void addTask({required Task task});

  void deleteTask({required int id});

  bool changeCompleteTask({required int id});

  Stream<List<Task>> listenTask();
}
