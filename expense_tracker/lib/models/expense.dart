import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining_sharp,
  Category.travel: Icons.flight_takeoff_sharp,
  Category.leisure: Icons.movie_sharp,
  Category.work: Icons.work_sharp,
};

class Expense {

  Expense({required this.title, required this.amount, required this.date, required this.category})
    : id = uuid.v4();

  Expense.defaultExpense() :
        id = uuid.v4(),
        title = '',
        amount = 0,
        date = DateTime.now(),
        category = Category.leisure;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}
