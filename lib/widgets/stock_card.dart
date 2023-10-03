import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  final String companyName;
  final double price;
  final double percentageChange;

  const StockCard({
    super.key,
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ,))
      },
      child: Card(  
        
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        elevation: 5.0,  
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    symbol,
                    style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
                  ),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    companyName,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '${percentageChange.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: percentageChange > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
