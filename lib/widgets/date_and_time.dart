import 'package:flutter/material.dart';

import '../models/clock_stream.dart';

class DateAndTime extends StatelessWidget {
  final ClockStream _clockStream = ClockStream();
  DateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _clockStream.clockStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime now = snapshot.data!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${now.hour}:${now.minute}:${now.second}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
                style: Theme.of(context)
                    .textTheme 
                    .titleMedium!
                    .copyWith(color: Colors.white),  
              ),
            ],
          );
        }
        else
        {
          return const Text('Loading date and time...');
        }
      },
    );
  }
}
