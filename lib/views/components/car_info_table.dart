import 'package:flutter/cupertino.dart';

class CarInfoTable extends StatelessWidget {
  const CarInfoTable(
      {super.key, required this.columnName, required this.carInfo});

  final String columnName;
  final String carInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(columnName), Text(carInfo)],
    );
  }
}
