import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.model_training),
            title: Text('bench press'),
            subtitle: Text('アルバムの説明'),
          ),
        ],
      ),
    );
  }
}
