// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  bool isComplete;

  Task({
    required this.title,
    required this.id,
    this.isComplete = false,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isComplete,
      ];
}
