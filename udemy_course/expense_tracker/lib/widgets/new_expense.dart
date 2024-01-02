import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Please enter valid input"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text("Okay"))
          ],
        )
      );
      return;
    }

    widget.onAddExpense(
      Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory)
    );

    Navigator.pop(context);

  }

  void _showDatePicker() async{

    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            // keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text("Title")
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount")
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month)
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((e) =>
                  DropdownMenuItem(
                    value: e,
                    child: Text(e.name.toUpperCase())
                  ),
                ).toList(),
                onChanged: (value){
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("SAVE")
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("CANCEL")
              )
            ],
          )
        ],
      ),
    );
  }
}