// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

DateFormat format = DateFormat.yMd();

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('\$${expense.amount.toString()}'),
            ],
          ),
          const Spacer(),
          Icon(expense.category.icon),
          const SizedBox(
            width: 20,
          ),
          Text(format.format(expense.date)),
        ],
      ),
    );
  }
}
