import 'package:autobaloo/models/car.dart';
import 'package:flutter/material.dart';

class CarChips extends StatelessWidget {
  const CarChips({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Chip(
          avatar: const Icon(Icons.directions_car, color: Colors.lightBlue),
          label: Text('${car.carKilometers} km'),
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        if (car.carModel?.modelFuelType != null)
          Chip(
            avatar:
                const Icon(Icons.local_gas_station, color: Colors.lightGreen),
            label: Text(car.carModel!.modelFuelType),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        if (car.carModel?.modelEngineBox != null)
          Chip(
            avatar: const Icon(Icons.build, color: Colors.orange),
            label: Text(car.carModel!.modelEngineBox),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        // if (car.carModel?.modelEuropeanCode != null)
        //   Chip(
        //     avatar: const Icon(Icons.info, color: Colors.pink),
        //     label: Text(car.carModel!.modelEuropeanCode),
        //     labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        //   ),
      ],
    );
  }
}
