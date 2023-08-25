import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../widgets/body.dart';
import '../../widgets/budget.dart';
import '../../widgets/radius_container.dart';
import '../../widgets/total_cost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// ? DATE
  DateTime selectedDate = DateTime.now();
  void date(context) {
    showMonthPicker(context: context, initialDate: selectedDate, firstDate: DateTime(2000), lastDate: DateTime.now()).then((value) {
      setState(() {
        if (selectedDate != value && value != null) {
          selectedDate = value;
        }
      });
    });
  }

  void incrementMonth() {
    if (selectedDate.month == DateTime.now().month && selectedDate.year == DateTime.now().year) return;
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    });
  }

  void decrementMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    });
  }

// // ? Price format
//   String price = '114895000';

//   String priceFormat(priceFormat) {
//     int pft = 0;
//     List pfl = priceFormat.toString().split('');
//     for (int i = priceFormat.toString().length; i > 1; i--) {
//       pft += 1;
//       if (pft == 3) {
//         pfl.insert(i - 1, ',');
//         pft = 0;
//       }
//     }
//     return pfl.join();
//   }

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
          TotalCost(
            incrementMonth: incrementMonth,
            decrementMonth: decrementMonth,
            selectedDate: selectedDate,
            date: date,
          ),
          Body(currentValueBudget: currentValueBudget),
        ]),
      ),
    );
  }
}
