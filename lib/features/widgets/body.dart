import 'package:flutter/material.dart';
import 'package:hamyon/features/widgets/radius_container.dart';

import 'budget.dart';
import 'cost_list.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.currentValueBudget,
  });

  final double currentValueBudget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: RadiusContainer(
        color: Colors.deepPurple[100],
        child: Column(
          children: [
            Budget(
              currentValueBudget: currentValueBudget,
            ),
            const CostList()
          ],
        ),
      ),
    );
  }
}
