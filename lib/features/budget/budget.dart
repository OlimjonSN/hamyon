import 'package:flutter/material.dart';

import '../widgets/radius_container.dart';

class Budget extends StatefulWidget {
  double currentValueBudget;
  Budget({required this.currentValueBudget, super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RadiusContainer(
          color: Colors.deepPurple[100],
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Oylik byudjet:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${widget.currentValueBudget.toStringAsFixed(0)}.0 so\'m',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
                    ),
                    const Spacer(),
                    const Text(
                      '0.0%',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Slider(
                    label: widget.currentValueBudget.toStringAsFixed(0),
                    min: 0,
                    max: 10000000,
                    divisions: 10000000,
                    value: widget.currentValueBudget,
                    onChanged: (((value) {
                      setState(() {
                        widget.currentValueBudget = value;
                      });
                    })))
              ],
            ),
          )),
    );
  }
}
