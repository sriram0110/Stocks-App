import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/models/stock.dart';
import 'package:stocks_app/widgets/stock_buy_sell.dart';

import '../widgets/chart/line_chart.dart';
// import 'package:stocks_app/widgets/date_and_time.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.stock});

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff232d37),
      ),
      backgroundColor: const Color(0xff232d37),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), 
          child: Column(
            children: [
              FadeInUp(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stock.companyName,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: const Color.fromARGB(255, 157, 156, 156)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 175, 174, 174)),
                          color: Colors.grey),
                      child: Text(
                        stock.symbol,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FadeInLeft(
                child: Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FadeInRight(
                child: Text(
                  '${stock.percentageChange.toStringAsFixed(2)}%',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color:
                          stock.percentageChange > 0 ? Colors.green : Colors.red),
                ),
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // DateAndTime(),
              const SizedBox(
                height: 20.0,
              ),
              const StockBuyAndSell(),
              const SizedBox(
                height: 20.0,
              ),
              Expanded( 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChartWidget(),
                ),
              ),
        
              // const SizedBox(
              //   height: 30.0 ,   
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
