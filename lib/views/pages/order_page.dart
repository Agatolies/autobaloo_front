import 'package:autobaloo/helper/utils/functions.dart';
import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/car_service.dart';
import 'package:autobaloo/views/components/car_card.dart';
import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:autobaloo/views/sections/title_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key, required this.carId});

  final String carId;
  final CarService carService = CarService();

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late Future<Car> futureCar;

  @override
  void initState() {
    super.initState();
    futureCar = sl.get<CarService>().getCar(widget.carId);
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
        const TitleSection(title: 'Résumé'),
        FutureBuilder<Car>(
            future: futureCar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarCard.fromCar(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            }),
        FutureBuilder<Car>(
            future: futureCar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ElevatedButton(
                    onPressed: () {
                      openUrl(snapshot.data!.carSalePrice);
                      context.goNamed('order-confirmation');
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.teal.shade300,
                        elevation: 4,
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        maximumSize: const Size(200, 150),
                        padding: const EdgeInsets.all(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Paiement'),
                        Icon(Icons.arrow_circle_right_outlined),
                      ],
                    ));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            })
      ],
    );
  }
}

// Si pas connecté --> renvoi vers Login
// Résumé de la voiture
// Image de la voiture
// Formulaire (récupération des données clients)
// Bloc récapitulatif avec montant acompte
// CheckBox je valide
// Bouton paiement Stripe
// Redirection --> Account (pour voir le statut de l'achat)
