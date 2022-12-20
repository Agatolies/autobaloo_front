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

      return GridView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard.fromCar(cars[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop ? 3 : 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        primary: false,
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
      );
    });
  }
}
