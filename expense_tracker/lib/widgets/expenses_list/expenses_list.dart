import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final Function removeExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.55),
              margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.delete, color: Colors.white),
                  const Spacer(),
                  const Icon(Icons.delete, color: Colors.white),
                ]
              ),
            ),
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
          ),
    );
  }
}
