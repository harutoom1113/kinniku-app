import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinniku/list.dart';
import 'package:kinniku/list_vm.dart';

class PageWidget extends ConsumerWidget {
  final Color color;

  const PageWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lists = ref.watch(listsProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _showBottomSheet(context, ref);
                },
                child: Text('追加'),
              ),
            ],
          ),
          for (final list in lists)
            ListTile(
              title: Text(list.title),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  ref.read(listsProvider.notifier).removeTodo(list.id);
                },
              ),
            ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, WidgetRef ref) {
  final list = ref.watch(listsProvider);

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 500, // シートの高さを指定
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("トレーニングメニューを選択してください"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listsProvider.notifier)
                      .addTodo(
                        // 適当なデータを渡しています
                        ListData(
                          id: '${list.length}',
                          title: 'ベンチプレス',
                          icon: Icons.model_training,
                        ),
                      );
                },
                child: Text('ベンチプレス'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
