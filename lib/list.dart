import 'package:flutter/material.dart';

@immutable
class ListData {
  const ListData({required this.icon, required this.title, required this.id});

  final IconData icon;
  final String title;
  final String id;
}
