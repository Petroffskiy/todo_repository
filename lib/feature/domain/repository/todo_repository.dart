import 'package:todo_repositories/feature/domain/entities/task.dart';

abstract class TodoRepository {
  Future<List<Task>> getAllTask();
}
