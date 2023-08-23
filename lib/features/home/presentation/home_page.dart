import 'package:flutter/material.dart';
import 'package:hamyon/features/budget/budget.dart';

import '../../widgets/radius_container.dart';
import '../../widgets/total_cost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    price = priceFormat(price);
    super.initState();
  }

// ? DATE
  DateTime selectedDate = DateTime.now();
  void date(context) {
    showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2022), lastDate: DateTime(2025)).then((value) {
      setState(() {
        if (selectedDate != value && value != null) {
          selectedDate = value;
        }
      });
    });
  }

// ? Price format
  String price = '114895000';

  String priceFormat(priceFormat) {
    int pft = 0;
    List pfl = priceFormat.toString().split('');
    for (int i = priceFormat.toString().length; i > 1; i--) {
      pft += 1;
      if (pft == 3) {
        pfl.insert(i - 1, ',');
        pft = 0;
      }
    }
    return pfl.join();
  }

  // ? Slider Budget
  double currentValueBudget = 0;
  // String budget = currentValueBudget.toStringAsFixed(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mening Hamyonim'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Column(children: [
          TotalCost(selectedDate: selectedDate, price: price, date: date),
          Expanded(
            flex: 3,
            child: RadiusContainer(
              color: Colors.deepPurple[100],
              child: Column(
                children: [
                  Budget(
                    currentValueBudget: currentValueBudget,
                  ),
                  const Expanded(
                    flex: 4,
                    child: RadiusContainer(
                      child: Center(child: Text('data')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
