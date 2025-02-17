import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:todo_with_bloc/viewmodel/event/todo_event.dart';
import 'package:todo_with_bloc/viewmodel/state/todo.dart';
import 'package:todo_with_bloc/viewmodel/state/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoList > {
  TodoBloc():super(TodoList(todos: [])){
    on<TodoAdd>((event, emit) {

      //  var updateList=state.todos;
      //  updateList.add([event.name, event.info]);

      final updateList = List<Todo>.from(state.todos)..add(Todo(name: event.name, description: event.info));
       emit(TodoList(todos: updateList));
    },);
  }
}
