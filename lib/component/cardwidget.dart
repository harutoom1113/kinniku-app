import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String id;

  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.id,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isExpanded ? 180 : 100, // ← 高さをアニメーションさせる
        child: Card(
          key: ValueKey(widget.id),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(widget.icon),
                const SizedBox(width: 16),
                Text(widget.title, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 16),
                if (_isExpanded)
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(width: 16),

                        // 重量入力欄
                        SizedBox(
                          width: 80,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '重量',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              // 重量の更新処理
                            },
                          ),
                        ),

                        const SizedBox(width: 8),

                        // 回数入力欄
                        SizedBox(
                          width: 80,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '回数',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              // 回数の更新処理
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
