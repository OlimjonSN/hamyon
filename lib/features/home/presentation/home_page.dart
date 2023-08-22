import 'package:flutter/material.dart';

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
    priceFormat();
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

  String price = '114895000';

  priceFormat() {
    int pft = 0;
    List pfl = price.split('');
    for (int i = price.length; i > 1; i--) {
      pft += 1;
      if (pft == 3) {
        pfl.insert(i - 1, ',');
        pft = 0;
      }
    }
    price = pfl.join();
  }

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
                  Expanded(
                    flex: 1,
                    child: RadiusContainer(
                      color: Colors.deepPurple[100],
                      child: const Center(child: Text('data')),
                    ),
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
