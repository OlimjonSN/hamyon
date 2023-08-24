import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalCost extends StatelessWidget {
  final DateTime selectedDate;
  final Function date;
  final Function incrementMonth;
  final Function decrementMonth;
  const TotalCost({
    required this.incrementMonth,
    required this.decrementMonth,
    required this.selectedDate,
    required this.date,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLastDate = selectedDate.month == DateTime.now().month && selectedDate.year == DateTime.now().year;

    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: TextButton(
                  onPressed: () {
                    date(context);
                  },
                  child: Text(
                    (DateFormat('MMMM yyyy').format(selectedDate)).toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        decrementMonth();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 38,
                      )),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '1,900,000',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.5),
                    ),
                    Text('so\'m', style: TextStyle(fontSize: 20, color: Colors.green, height: 0.6))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        incrementMonth();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 38,
                        color: isLastDate ? Colors.grey : Colors.black,
                      )),
                ),
              ]),
            ),
          ],
        ));
  }
}
