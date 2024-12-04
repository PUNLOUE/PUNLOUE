 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category selectedCategory = Category.leisure; // Use Category enum directly
  String? selectedDate;

  String get title => _titleController.text;
  double get amount => double.parse(_valueController.text);

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: DateTime.now(), // For now it's a fake data
      category: selectedCategory, // Use selected category from enum
    );

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Input with counterText
           TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
              counterText: '0/50',
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Amount and Date Row
          Row(
            children: [
              // Amount Input
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Date Picker
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          selectedDate ?? "No date selected",
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedDate == null ? Colors.grey[600] : Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.calendar_today, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

           
          //Buttons and drop dropdown category
          Row(
            children: [
              // Category Dropdown
                      Expanded(
                        child: SizedBox(
                        height: 60, // Match the size of the amount field
                        child: DropdownButtonFormField<Category>(
                          value: selectedCategory,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                          ),
                          onChanged: (Category? value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                          items: Category.values.map<DropdownMenuItem<Category>>((Category category) {
                            return DropdownMenuItem<Category>(
                              value: category,
                              child: Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(category.toString().split('.').last.toUpperCase()),
                                ],
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                    ),
              // Cancel Button
              TextButton(
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 16),

              // Save Button
              ElevatedButton(
                onPressed: onAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 207, 247),
                ),
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
