import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expense_item.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> expenses = [
    Expense(
      title: 'Food',
      amount: 100.0,
      date: DateTime.now(),
      category: ExpenseType.FOOD,
    ),
    Expense(
      title: 'Travel',
      amount: 200.0,
      date: DateTime.now(),
      category: ExpenseType.TRAVEL,
    ),
    Expense(
      title: 'Leisure',
      amount: 300.0,
      date: DateTime.now(),
      category: ExpenseType.LEISURE,
    ),
    Expense(
      title: 'Work',
      amount: 400.0,
      date: DateTime.now(),
      category: ExpenseType.WORK,
    ),
  ];

  void addExpense() {
    setState(() {
      expenses.add(
        Expense(
          title: 'New Expense',
          amount: 500.0,
          date: DateTime.now(),
          category: ExpenseType.WORK,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addExpense,
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Expense App Screen'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ExpenseScreen()));
}
