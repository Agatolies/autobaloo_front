import 'package:flutter/cupertino.dart';

class CarInfoTable extends StatelessWidget {
  const CarInfoTable(
      {super.key, required this.columnName, required this.carInfo});

  final String columnName;
  final String carInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 40, right: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  columnName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Text(carInfo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),)
            ],
          ),
        ),
      ],
    );
  }
}
