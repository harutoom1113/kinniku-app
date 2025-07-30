import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinniku/list.dart';

class ListsNotifier extends StateNotifier<List<ListData>> {
  ListsNotifier()
    : super([
        // 初期値として適当なデータを入れています
        ListData(icon: Icons.model_training, title: 'ベンチプレス', id: '0'),
        ListData(icon: Icons.model_training, title: 'スクワット', id: '1'),
        ListData(icon: Icons.model_training, title: 'デッドリフト', id: '2'),
      ]);

  void addTodo(ListData data) {
    // stateのみ変更の処理をしているが、DBの操作もここで追記必要
    state = [...state, data];
  }

  void removeTodo(String dataId) {
    // stateのみ変更の処理をしているが、DBの操作もここで追記必要
    state = [
      for (final data in state)
        if (data.id != dataId) data,
    ];
  }
}

final listsProvider = StateNotifierProvider<ListsNotifier, List<ListData>>((
  ref,
) {
  return ListsNotifier();
});
