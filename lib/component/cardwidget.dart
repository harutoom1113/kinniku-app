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
                  const Expanded(
                    child: Text(
                      'ベンチプレスの説明がここに入ります。',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
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
