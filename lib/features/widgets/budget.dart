import 'package:flutter/material.dart';

import 'radius_container.dart';

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
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('10,000,000 so\'m')),
                    const Spacer(),
                    const Text(
                      '0.0%',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                    height: 5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.56,
                      heightFactor: 2,
                      child: Container(
                        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.deepPurpleAccent[100]!, Colors.deepPurple[300]!, Colors.deepPurple.shade100, Colors.deepPurple[300]!]), borderRadius: BorderRadius.circular(10), color: Colors.deepPurple[300], boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent[100]!,
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ]),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
