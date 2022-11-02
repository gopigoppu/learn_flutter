import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput = '';
  String amountInput = '';
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

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
              // controller: titleController,
              onChanged: (value) {
                setState(() {
                  titleInput = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: ((value) {
                setState(() {
                  amountInput = value;
                });
              }),
            ),
            TextButton(
              onPressed: () {
                widget.addTx(titleInput, double.parse(amountInput));
                // print(titleController.text);

                print({titleInput, amountInput});
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
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
