import 'package:flutter/cupertino.dart';

class CarInfoTable extends StatelessWidget {
  const CarInfoTable(
      {super.key, required this.columnName, required this.carInfo});

  final String columnName;
  final String carInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              columnName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(carInfo,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),)
          ],
        ),
      ],
    );
  }
}
