
import 'package:todo_with_bloc/viewmodel/state/todo.dart';

abstract class TodoState {}

class TodoList extends TodoState{
  final List<Todo> todos;

  TodoList({required this.todos});
}
