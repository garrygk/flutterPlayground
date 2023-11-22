import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: "Flutter course", amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: "Cinema", amount: 15.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Travel", amount: 19.99, date: DateTime.now(), category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses)
          )
        ],
      ),
    );
  }
}