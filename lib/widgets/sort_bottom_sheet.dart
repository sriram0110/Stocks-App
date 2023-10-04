import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/constants/stock_data.dart';
import 'package:stocks_app/enums/sorting_enums.dart';
import 'package:stocks_app/utilities/app_constants.dart';

import '../providers/stock_provider.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(
            Icons.sort_by_alpha,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            sortName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
          trailing: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Consumer<StockProvider>(
              builder: (context, value, child) {
                return value.sortNameAscending
                    ? const Icon(
                        upArrow,
                        color: Colors.white,
                      )
                    : const Icon(
                        downArrow,
                        color: Colors.white,
                      );
              },
            ),
          ),
          onTap: () {
            Provider.of<StockProvider>(context, listen: false)
                .toggleNameSortOrder();
            Provider.of<StockProvider>(context, listen: false).setSortingOption(SortingOption.companyName);
            Provider.of<StockProvider>(context, listen: false).sortStocks(StockData.stockData);
            Navigator.of(context).pop();

          },
        ),
        ListTile(
          leading: const Icon(
            Icons.attach_money,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            sortPrice,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
          trailing: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Consumer<StockProvider>(
              builder: (context, value, child) {
                return value.sortPriceAscending
                    ? const Icon(
                        upArrow,
                        color: Colors.white,
                      )
                    : const Icon(
                        downArrow,
                        color: Colors.white,
                      );
              },
            ),
          ),
          onTap: () {
            Provider.of<StockProvider>(context, listen: false).setSortingOption(SortingOption.price);
            Provider.of<StockProvider>(context, listen: false)
                .togglePriceSortOrder();
            Provider.of<StockProvider>(context, listen: false).sortStocks(StockData.stockData);

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
