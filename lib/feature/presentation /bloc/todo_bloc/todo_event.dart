part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTasks extends TodoEvent {
  const GetAllTasks();
  @override
  List<Object> get props => [];
}

class AddTask extends TodoEvent {
  final Task task;

  const AddTask({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TodoEvent {
  final int id;

  const DeleteTask({required this.id});

  @override
  List<Object> get props => [id];
}

class ChangeCompleteTask extends TodoEvent {
  final int id;
  const ChangeCompleteTask({required this.id});

  @override
  List<Object> get props => [id];
}

class ListenTodos extends TodoEvent {
  const ListenTodos();
  @override
  List<Object> get props => [];
}
