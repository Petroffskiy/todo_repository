part of 'todo_bloc.dart';

enum Status { init, update }

class TodoState extends Equatable {
  final List<Task> todo;
  final Status status;
  const TodoState({
    this.todo = const [],
    this.status = Status.init,
  });

  @override
  List<Object> get props => [
        todo,
        status,
      ];

  TodoState copyWith({
    final List<Task>? todo,
    final Status? status,
  }) {
    return TodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
    );
  }
}
