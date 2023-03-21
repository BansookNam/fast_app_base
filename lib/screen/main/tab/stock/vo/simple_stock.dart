class SimpleStock {
  final String name;

  SimpleStock(this.name);

  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json['name']);
  }
}
