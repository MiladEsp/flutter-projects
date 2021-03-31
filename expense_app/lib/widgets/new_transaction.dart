import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final _enteredTitle = _titleController.text;
    final _enteredAmount = double.parse(_amountController.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(_enteredTitle, _enteredAmount,
        _selectedDate); //widget. accesses the property from the NewTransaction class

    Navigator.of(context)
        .pop(); // close the modal sheet after entering all the info
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
    }); // will execute the anon function once the Future result is available
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                //onChanged: (val) => titleInput = val,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                //onChanged: (val) => amountInput = val,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>
                    _submitData(), // don't care about the variable received
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).textTheme.button.color,
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
