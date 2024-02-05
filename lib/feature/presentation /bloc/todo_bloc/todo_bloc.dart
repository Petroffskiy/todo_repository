import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_repositories/feature/domain/entities/task.dart';
import 'package:todo_repositories/feature/repository/task_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TaskRepository taskRepository;
  TodoBloc(this.taskRepository) : super(const TodoState()) {
    on<GetAllTasks>(_getAllTasks);
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<ChangeCompleteTask>(_changeCompleteTask);
    on<ListenTodos>(_listenTodos);
  }

  FutureOr<void> _getAllTasks(GetAllTasks event, Emitter<TodoState> emit) {
    final List<Task> tasks = taskRepository.getAllTasks();
    emit(state.copyWith(
      todo: tasks,
      status: state.status == Status.init ? Status.update : Status.init,
    ));
  }

  FutureOr<void> _addTask(AddTask event, Emitter<TodoState> emit) {
    taskRepository.addTask(task: event.task);
    final List<Task> tasks = state.todo;
    // tasks.add(event.task);
    emit(state.copyWith(
        todo: tasks,
        status: state.status == Status.init ? Status.update : Status.init));
  }

  FutureOr<void> _deleteTask(DeleteTask event, Emitter<TodoState> emit) {
    taskRepository.deleteTask(id: event.id);
    final List<Task> tasks = state.todo;
    tasks.removeWhere((element) => element.id == event.id);
    emit(state.copyWith(
        todo: tasks,
        status: state.status == Status.init ? Status.update : Status.init));
  }

  FutureOr<bool> _changeCompleteTask(
      ChangeCompleteTask event, Emitter<TodoState> emit) {
    taskRepository.changeCompleteTask(id: event.id);
    final List<Task> task = state.todo;
    bool isComplete =
        task.firstWhere((element) => element.id == event.id).isComplete;
    print('bloc task: $isComplete');
    emit(state.copyWith(
      todo: task,
      status: state.status == Status.init ? Status.update : Status.init,
    ));
    return isComplete;
  }

  FutureOr<void> _listenTodos(
      ListenTodos event, Emitter<TodoState> emit) async {
    await emit.forEach(taskRepository.listenTask(), onData: (List<Task> data) {
      return state.copyWith(todo: data);
    });
  }
}
