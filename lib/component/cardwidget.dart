import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const CardWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 16), // アイコンとテキストの間にスペースを追加
            Text(title, style: TextStyle(fontSize: 18)),
            SizedBox(width: 16), // アイコンとテキストの間にスペースを追加
            Expanded(child: Text('ベンチプレスの説明がここに入ります。')),
          ],
        ),
      ),
    );
  }
}
