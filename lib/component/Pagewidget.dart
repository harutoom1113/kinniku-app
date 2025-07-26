import 'package:flutter/material.dart';
import 'package:kinniku/component/cardwidget.dart';

class PageWidget extends StatelessWidget {
  final Color color;

  const PageWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text('追加'),
            ),
          ],
        ),
        CardWidget(),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
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
                  Navigator.pop(context); // シートを閉じる
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
