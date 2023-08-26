import 'package:flutter/material.dart';
import 'package:hamyon/models/cost_model.dart';
import 'package:intl/intl.dart';

import 'radius_container.dart';

class CostList extends StatelessWidget {
  final List<CostModel> items;
  const CostList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return RadiusContainer(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(items[index].icon),
                ),
                title: Text(
                  items[index].name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(DateFormat('dd MMM yyyy').format(items[index].date).toString()),
                trailing: Text(items[index].price.toString()),
              );
            },
            itemCount: items.length),
      ),
    );
  }
}
