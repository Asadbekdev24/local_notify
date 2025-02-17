import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/view/widgets/custom_container.dart';
import 'package:todo_with_bloc/viewmodel/bloc/todo_bloc.dart';
import 'package:todo_with_bloc/viewmodel/event/todo_event.dart';
import 'package:todo_with_bloc/viewmodel/state/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final nameController=TextEditingController();
  final infoController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoBloc, TodoList>(

        builder: (context, state) {

          if(state.todos.isEmpty)
          {
            return Center(child: Text("no data"),);
          }
          else
          {
            return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return CustomContainer(matn: state.todos[index].name, batafsil: state.todos[index].description);
            },
          );
          }

        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Add to do"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "input title"),
                  controller: nameController,),
                TextField(
                  decoration: InputDecoration(hintText: "input description"),
                  controller: infoController,),
              ],
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),
              TextButton(onPressed: (){
                if (nameController.text.isNotEmpty && infoController.text.isNotEmpty) {
                  context.read<TodoBloc>().add(
                        TodoAdd(
                          name: nameController.text,
                          info: infoController.text,
                        ),
                      );
                }
                Navigator.pop(context);

              }, child: Text("Add")),
            ],
          );
        },);
      }, child: Icon(Icons.add),),
    );
  }
}
