import 'package:flutter/material.dart';

import 'radius_container.dart';

class CostList extends StatelessWidget {
  const CostList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: RadiusContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListView.builder(
              itemBuilder: (context, indext) {
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.airplane_ticket),
                  ),
                  title: const Text('NewYork - Tashkent'),
                  subtitle: Text(DateTime.now().toString()),
                  trailing: const Text('2,000,000'),
                );
              },
              itemCount: 10),
        ),
      ),
    );
  }
}
