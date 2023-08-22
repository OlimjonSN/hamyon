import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalCost extends StatefulWidget {
  final DateTime selectedDate;
  final String price;
  final Function date;
  const TotalCost({required this.date, required this.selectedDate, required this.price, super.key});

  @override
  State<TotalCost> createState() => _TotalCostState();
}

class _TotalCostState extends State<TotalCost> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: TextButton(
                  onPressed: () {
                    widget.date(context);
                  },
                  child: Text(
                    (DateFormat('MMMM yyyy').format(widget.selectedDate)).toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_left_rounded)),
                Text(
                  widget.price,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.5),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_right_rounded)),
              ]),
            ),
          ],
        ));
  }
}
