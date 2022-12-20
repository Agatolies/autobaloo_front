import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/views/components/car_card.dart';
import 'package:flutter/material.dart';

class CarGrid extends StatelessWidget {
  const CarGrid({super.key, required this.cars});

  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
      final bool isDesktop = constraints.maxWidth >= 800;
      final bool isLargeDesktop = constraints.maxWidth >= 1200;

      int crossAxisCount = 1;
      if (isLargeDesktop) {
        crossAxisCount = 3;
      } else if (isDesktop) {
        crossAxisCount = 2;
      }

      return GridView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard.fromCar(cars[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4 / 5),
        primary: false,
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
      );
    });
  }
}
