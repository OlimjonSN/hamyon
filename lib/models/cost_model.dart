import 'package:flutter/material.dart';

class CostModel {
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final IconData icon;
  CostModel({required this.id, required this.name, required this.price, required this.date, this.icon = Icons.money_off_csred_outlined});
}

class Costs {
  final List<CostModel> _items = [
    CostModel(id: '1', name: 'Ticket NewYork to Toshkent', price: 2000000, date: DateTime(2023, 08), icon: Icons.airplane_ticket_outlined),
  ];

  List<CostModel> get items {
    return _items;
  }

  void addCost({required String name, required double price, required DateTime date, IconData icon = Icons.money_off_csred_outlined}) {
    _items.insert(0, CostModel(id: '${_items.length + 1}', name: name, price: price, date: date, icon: icon));
  }
}
