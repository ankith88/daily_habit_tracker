import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:calendar_timeline/calendar_timeline.dart';


import '../../../constants.dart';
import '../../habbit_list.dart';
import '../../new_habbit.dart';
import '../../../model/habbits.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final List<Habbits> _userHabbits = [];
  DateTime _selectedValue = DateTime.now();

  void _addHabbit(String title, DateTime selectedDate) {
    final newHabbit = Habbits(
        id: DateTime.now().toString(),
        title: title,
        completedDaysCount: 0,
        totalDaysCount: 0,
        dateStarted: selectedDate);

    setState(() {
      _userHabbits.add(newHabbit);
    });
  }

  void _openAddHabbit(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: kSecondaryTextColor,
        context: ctx,
        builder: (_) {
          return NewHabbit(_addHabbit);
        });
  }

  void _showHabitList(){
    print('inside function');
    HabbitList(_userHabbits, _selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('Daily Habbit Tracker'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019, 1, 1),
                  lastDate: DateTime(2024, 1, 1),
                  onDateSelected: (date) {
                    _selectedValue = date!;
                  } ,
                  leftMargin: 20,
                  monthColor: kAppBackgroundColor,
                  dayColor: kAppBackgroundColor,
                  activeDayColor: kAmountTextColor,
                  activeBackgroundDayColor: kSecondaryTextColor,
                  dotsColor: kAmountTextColor,
                ),
              ),
              HabbitList(_userHabbits, _selectedValue),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kAppBarColor,
        onPressed: () => _openAddHabbit(context),
      ),
    );
  }
}
