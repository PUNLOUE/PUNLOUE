// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();
// Define the ExpenseType enum with icons
enum ExpenseType {
  FOOD,
  TRAVEL,
  LEISURE,
  WORK;

  IconData get icon {
    switch (this) {
      case ExpenseType.FOOD:
        return Icons.food_bank;
      case ExpenseType.TRAVEL:
        return Icons.travel_explore;
      case ExpenseType.LEISURE:
        return Icons.golf_course;
      case ExpenseType.WORK:
        return Icons.work;
    }
  }
}

// Define the Expense model class
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    String? id,
  }) : id = id ?? const Uuid().v1();
}

void main() {
  var expense = Expense(
    title: 'Food',
    amount: 100.0,
    date: DateTime.now(),
    category: ExpenseType.FOOD,
  );
  print(expense.id);
}
