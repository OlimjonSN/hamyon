import 'package:flutter/material.dart';
import 'package:hamyon/features/widgets/radius_container.dart';
import 'package:hamyon/models/cost_model.dart';

import 'budget.dart';
import 'cost_list.dart';

class Body extends StatelessWidget {
  final List<CostModel> item;
  const Body({
    super.key,
    required this.item,
    required this.currentValueBudget,
  });

  final double currentValueBudget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: RadiusContainer(
        color: Colors.deepPurple[100],
        child: Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Budget(
              currentValueBudget: currentValueBudget,
            ),
            Positioned(
              bottom: 0,
              child: CostList(items: item)),
          ],
        ),
      ),
    );
  }
}
