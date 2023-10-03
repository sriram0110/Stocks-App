import 'package:flutter/material.dart';

import '../models/stock.dart';

class StockProvider extends ChangeNotifier {
  final List<StockModel?> _selectedStockData = [];

  List<StockModel?> get selectedStockData => _selectedStockData;

  void addSelectedStock(StockModel stock) {
    _selectedStockData.add(stock);
    notifyListeners();
  }

  void clearSelectedStockData() {
    _selectedStockData.clear();
    notifyListeners();
  }
}
