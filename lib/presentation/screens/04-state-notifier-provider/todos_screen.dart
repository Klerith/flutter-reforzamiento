import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/todos_provider.dart';


class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
           ref.read(todosProvider.notifier).addTodo();
        },
      ),
    );
  }
}


class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final todos = ref.watch(todosProvider);


    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        
        final todo = todos[index];

        return SwitchListTile(
          title: Text( todo.description ),
          subtitle: Text( todo.completedAt.toString() ),
          value: todo.done, // True o False 
          onChanged: ( _ ) {
            ref.read( todosProvider.notifier )
              .toggleTodo(todo.id);
          }
        );
      },
    );
  }
}