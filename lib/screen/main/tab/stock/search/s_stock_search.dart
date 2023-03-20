import 'package:fast_app_base/screen/main/tab/stock/search/w_search_bar.dart';
import 'package:flutter/material.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({Key? key}) : super(key: key);

  @override
  State<StockSearchScreen> createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(controller: _controller),
      body: const Center(
        child: Text('Stock Search'),
      ),
    );
  }
}
