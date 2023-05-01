import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:uuid/uuid.dart';

import 'package:river_app/domain/domain.dart';

const _uuid = Uuid();


final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier(); // ???
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  
  TodosNotifier(): super([
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now() ),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
  ]);

  void addTodo() {
    state = [
      ...state,
      Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null ),
    ];
  }

  void toggleTodo( String id ) {

    state = state.map((todo) {

      if( todo.id != id ) return todo;

      if ( todo.done ) return todo.copyWith( completedAt: null );

      return todo.copyWith(completedAt: DateTime.now());
      
    }).toList();


  }

}

