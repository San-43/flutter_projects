import 'package:flutter/material.dart';

class Category {
  final String id;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange
  });

  final String title;
  final Color color;
}
