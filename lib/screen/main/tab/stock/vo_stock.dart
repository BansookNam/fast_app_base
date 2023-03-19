class Stock {
  final String stockName;
  final int yesterdayClosePrice;
  final int currentPrice;
  final String stockImagePath;

  Stock({
    required this.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required this.stockImagePath,
  });
}
