class CostModel{
  String name;
  String price;
  DateTime date;
  CostModel({required this.name, required this.price, required this.date});

  factory CostModel.fromJson(Map<String, dynamic> json) {
    return CostModel(
      name: json['name'],
      price: json['price'],
      date: json['date'],
    );
  }
}

