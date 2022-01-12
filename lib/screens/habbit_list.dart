import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/habbits.dart';
import '../constants.dart';

class HabbitList extends StatefulWidget {
  final List<Habbits> habbits;
  DateTime selectedDate = DateTime.now();

  HabbitList(this.habbits, this.selectedDate);

  @override
  State<HabbitList> createState() => _HabbitListState();
}

class _HabbitListState extends State<HabbitList> {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void _incrementHabbitCounter(int index) {
    setState(() {
      widget.habbits[index].completedDaysCount =
          widget.habbits[index].completedDaysCount + 1;
    });
  }

  void deleteItem(index){
    /*
  By implementing this method, it ensures that upon being dismissed from our widget tree,
  the item is removed from our list of items and our list is updated, hence
  preventing the "Dismissed widget still in widget tree error" when we reload.
  */
    setState((){
      widget.habbits.removeAt(index);
    });
  }

  void undoDeletion(index, item){
    /*
  This method accepts the parameters index and item and re-inserts the {item} at
  index {index}
  */
    setState((){
      widget.habbits.insert(index, item);
    });
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: kErrorColor,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          print('habbit list selected date');
          print(widget.selectedDate);
          print('Habbit created start date');
          print(widget.habbits[index].dateStarted);
          if(widget.habbits[index].dateStarted == widget.selectedDate){
            return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(widget.habbits[index]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  color: kCardBackgroundColor,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 70,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '${widget.habbits[index].completedDaysCount}/' +
                              daysBetween(widget.habbits[index].dateStarted,
                                  DateTime.now())
                                  .toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: kAppBarColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.habbits[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kPrimaryTextColor,
                              ),
                            ),
                            Text(
                              'Start Date: ' +
                                  DateFormat.yMMMd()
                                      .format(widget.habbits[index].dateStarted),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              onPressed: () => _incrementHabbitCounter(index),
                              icon: Icon(Icons.add_circle),
                              tooltip: "Task Completed for the Day",
                              iconSize: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  elevation: 10,
                ),
                onDismissed: (direction) {
                  var item = widget.habbits.elementAt(index);
                  //To delete
                  deleteItem(index);
                  //To show a snackbar with the UNDO button
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Item deleted"),
                      action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            //To undo deletion
                            undoDeletion(index, item);
                          })));
                });
          } else {
            return Text('No Habbits Completed');
          }
        },
        itemCount: widget.habbits.length,
      ),
    );
  }
}
