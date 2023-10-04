import 'package:flutter/material.dart';
import 'package:stocks_app/enums/sorting_enums.dart';

import '../models/stock.dart';

class StockProvider extends ChangeNotifier {
  final List<StockModel?> _selectedStockData = [];
  SortingOption? _sortingOption;
  bool _sortNameAscending = true;
  bool _sortPriceAscending = true;
   List<Map<String, dynamic>> _sortedStocks = [];


  List<StockModel?> get selectedStockData => _selectedStockData;

  List<Map<String, dynamic>> get sortedStocks => _sortedStocks;


  SortingOption get sortedOption => _sortingOption!;

  bool get sortNameAscending => _sortNameAscending;
  bool get sortPriceAscending => _sortPriceAscending;

  void setSortingOption(SortingOption option) {
    _sortingOption = option;
    notifyListeners();
  }

   void togglePriceSortOrder() {
    _sortPriceAscending = !_sortPriceAscending;
    notifyListeners();
  }

    void toggleNameSortOrder() {
    _sortNameAscending = !_sortNameAscending;
    notifyListeners();
  }

  void addSelectedStock(StockModel stock) {
    _selectedStockData.add(stock);
    notifyListeners();
  }

  void clearSelectedStockData() {
    _selectedStockData.clear();
    notifyListeners();
  }

  void sortStocks(List<Map<String, dynamic>> stocks) {
    if (_sortingOption == SortingOption.companyName) {
      stocks.sort((a, b) {
        return _sortNameAscending
            ? b['companyName'].compareTo(a['companyName'])
            : a['companyName'].compareTo(b['companyName']);
      });
    } else if (_sortingOption == SortingOption.price) {
      stocks.sort((a, b) {
        return _sortPriceAscending ? b['price'].compareTo(a['price']) : a['price'].compareTo(b['price']);
      });
    }
    _sortedStocks = stocks;
  }

void clearSortedStocks()
{
  
}

}

