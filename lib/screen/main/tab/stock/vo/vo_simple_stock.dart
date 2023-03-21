class SimpleStock {
  final String stockName;

  SimpleStock({required this.stockName});

  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(stockName: json['name']);
  }
}
