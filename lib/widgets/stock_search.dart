import 'package:flutter/material.dart';

class StockSearchDelegate extends SearchDelegate<Map<String, dynamic>> {
  StockSearchDelegate(this.stockData);
  final List<Map<String, dynamic>> stockData;

  // List<String> searchTerms = []

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, {});
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, {}); //leave and close the searchbar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults(query);
  }

  Widget buildSearchResults(String query) {
    final results = stockData
        .where((stock) =>
            stock['symbol'].toLowerCase().contains(query.toLowerCase()) ||
            stock['companyName'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final stock = results[index];
        return ListTile(
          title: Text(
            stock['companyName'],
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            stock['symbol'],
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            // query = stock['symbol'];
            close(context, stock); //call
          },
        );
      },
    );
  }
}
