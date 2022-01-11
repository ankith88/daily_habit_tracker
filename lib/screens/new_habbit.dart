import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class NewHabbit extends StatefulWidget {
  final Function addTx;

  NewHabbit(this.addTx);

  @override
  State<NewHabbit> createState() => _NewHabbitState();
}

class _NewHabbitState extends State<NewHabbit> {
  final titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitTx() {
    final enteredTitle = titleController.text;

    if (enteredTitle.isEmpty) {
      return;
    }

    widget.addTx(enteredTitle, _selectedDate);

    Navigator.of(context).pop(); // Close the modal
  }

  void presentDatePicker() {
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
        elevation: 6,
        color: kAppBackgroundColor,
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            //Moves the button to the right
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Habbit Name'),
                controller: titleController,
                onSubmitted: (_) => submitTx(),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date chosen'
                          : DateFormat.yMMMMd().format(_selectedDate))),
                  TextButton(
                      onPressed: () {
                        presentDatePicker();
                      },
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kAppBarColor),
                      )),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              TextButton(
                onPressed: submitTx,
                child: Text('Add Habbit'),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: kAppBarColor,
                  backgroundColor: Colors.white,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  elevation: 5,
                ),
              ),
              Spacer(flex: 10),
            ],
          ),
        ));
  }
}
