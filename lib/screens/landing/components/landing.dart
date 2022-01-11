import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                height: MediaQuery.of(context).size.height * 0.2,
                child:  Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xff1b232e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, f) {
                      int day = DateTime.now().day + f;
                      return FittedBox(
                        child: Container(
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(right: 15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: day == DateTime.now().day
                                ? Color(0xff727be8)
                                : Color(0xff131b26),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${DateTime.now().day + f}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: day == DateTime.now().day
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: day == DateTime.now().day
                                      ? Colors.white
                                      : Colors.grey[500],
                                ),
                              ),
                              Text(
                                DateFormat('EE').format(
                                  DateTime.now().add(
                                    Duration(days: f),
                                  ),
                                ),
                                style: TextStyle(
                                    color: day == DateTime.now().day
                                        ? Colors.white
                                        : Colors.grey[700],
                                    fontWeight: day == DateTime.now().day
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              HabbitList(_userHabbits),
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
