import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleInput = '';
  // String amountInput = '';
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   setState(() {
              //     titleInput = value;
              //   });
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              controller: amountController,
              // onChanged: ((value) {
              //   setState(() {
              //     amountInput = value;
              //   });
              // }),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              // onPressed: () {
              //   widget.addTx(titleInput, double.parse(amountInput));
              //   // print(titleController.text);

              //   print({titleInput, amountInput});
              // },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.button?.color,
                backgroundColor: Theme.of(context).primaryColorDark,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
