

import 'package:equatable/equatable.dart';

abstract class TodoEvent  extends Equatable{
}

class TodoAdd extends TodoEvent{
  final String name;
  final String info;
  TodoAdd({required this.name, required this.info});

  @override
  
  List<Object?> get props => [name, info];
}

class TodoDeleted extends TodoEvent{
  final String todo;
  TodoDeleted(this.todo);

  @override

  List<Object?> get props => [todo];
}