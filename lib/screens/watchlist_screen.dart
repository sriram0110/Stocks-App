import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/constants/stock_data.dart';
import 'package:stocks_app/providers/stock_provider.dart';
// import 'package:stocks_app/widgets/date_and_time.dart';
import 'package:stocks_app/widgets/stock_card.dart';
import 'package:stocks_app/widgets/stock_search.dart';

import '../models/stock.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  // final List<Map<String, dynamic>?> _selectedStockData =
  //     []; //private field could be final

  // void removeSelectedSearch() {
  //   _selectedStockData.clear();
  // }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'WatchList',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white),
        ),
        actions: [
          Consumer<StockProvider>(
            builder: (context, stockProvider, child) {
              return stockProvider.selectedStockData.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        stockProvider.clearSelectedStockData();
                      },
                    )
                  : const SizedBox.shrink();
            },
          ),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () async {
              final selectedStock = await showSearch(
                context: context,
                delegate: StockSearchDelegate(StockData.stockData),
              );

              if (selectedStock != null &&
                  selectedStock.containsKey('symbol') &&
                  selectedStock.containsKey('companyName') &&
                  selectedStock.containsKey('price') &&
                  selectedStock.containsKey('percentageChange')) {
                stockProvider.addSelectedStock(
                  StockModel(
                    symbol: selectedStock['symbol'],
                    companyName: selectedStock['companyName'],
                    price: selectedStock['price'],
                    percentageChange: selectedStock['percentageChange'],
                  ),
                );
              }
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '29 September 2023',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.grey),
              ),
            ),
            // DateAndTime(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<StockProvider>(
                builder: (context, value, child) =>
                    value.selectedStockData.isEmpty
                        ? listOfStocks()
                        : ListView.builder(
                            itemCount: value.selectedStockData.length,
                            itemBuilder: (context, index) {
                              final stock = value.selectedStockData[index];
                              if (stock != null) {
                                return StockCard(
                                  symbol: stock.symbol,
                                  companyName: stock.companyName,
                                  price: stock.price,
                                  percentageChange: stock.percentageChange,
                                );
                              } else {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: listOfStocks(),
                                );
                              }
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listOfStocks() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: StockData.stockData.length,
      itemBuilder: (context, index) {
        final stock = StockData.stockData[index];
        return StockCard(
          symbol: stock['symbol'],
          companyName: stock['companyName'],
          price: stock['price'],
          percentageChange: stock['percentageChange'],
        );
      },
    );
  }
}
