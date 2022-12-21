import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/car_service.dart';
import 'package:autobaloo/views/components/car_card.dart';
import 'package:autobaloo/views/components/car_info_table.dart';
import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:autobaloo/views/sections/title_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDetailPage extends StatefulWidget {
  CarDetailPage({super.key, required this.carId});

  final String carId;
  final CarService carService = CarService();

  @override
  State<CarDetailPage> createState() => _CarDetail();
}

class _CarDetail extends State<CarDetailPage> {
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
        const TitleSection(
            title: 'Fiche technique',
            subtitle:
                'Toutes les caractéristiques de la voiture réunies en un seul endroit'),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //TODO : ajouter les paramètres dynamiques
                    children: const [
                      CarInfoTable(columnName: 'Type', carInfo: 'Diesel'),
                      CarInfoTable(
                          columnName: 'Année du modèle', carInfo: '2022'),
                      CarInfoTable(columnName: 'Couleur', carInfo: 'Noire'),
                      CarInfoTable(
                          columnName: 'Kilométrage', carInfo: '53.200'),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //TODO : ajouter les paramètres dynamiques
                    children: const [
                      CarInfoTable(columnName: 'Norme Euro', carInfo: 'EU6'),
                      CarInfoTable(
                          columnName: 'Puissance', carInfo: '81 kw (110 cv'),
                      CarInfoTable(
                          columnName: 'Nombre de portes', carInfo: '5'),
                      CarInfoTable(
                          columnName: 'Nombre de sièges', carInfo: '5'),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, right: 30, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                  () => context.pushNamed('rent',
                      params: <String, String>{'id': widget.carId.toString()}),
                  'Louer'),
              const SizedBox(width: 30),
              buildButton(
                  () => context.pushNamed('order',
                      params: <String, String>{'id': widget.carId.toString()}),
                  'Commander'),
            ],
          ),
        ),
        //
        // Card(
        //     elevation: 4,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(4),
        //     ),
        //     child: FutureBuilder<Car>(
        //         future: widget.carService.getCar(widget.id),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             return ListView(
        //               children: [
        //                 CarInfoTable(
        //                     columnName: 'Type',
        //                     carInfo:
        //                         snapshot.data?.carModel?.modelFuelType ??
        //                             '')
        //               ],
        //             );
        //           } else if (snapshot.hasError) {
        //             return Text('${snapshot.error}');
        //           }
        //           return const CircularProgressIndicator();
        //         }))
      ],
    );
  }

  Widget buildButton(VoidCallback onPressed, String title) {
    return ElevatedButton(
        onPressed: onPressed,
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
          children: [
            Text(title),
            const Icon(Icons.arrow_circle_right_outlined),
          ],
        ));
  }
}

// Si déjà réservées par l'utilisateur connecté
// - Bandeau récapitulatif de sa réservation
// Si achetée par l'utilisateur connecté
// - Bandeau récapitulatif de sa commande
// Image + boutons Location & Achat
// 2 formulaires
// - Achat
// -- Prix total
// -- Disponibilité
// -- Bouton réserver un essai routier
// -- Bouton commander
// - Location
// -- Prix journalier
// -- Bouton Location
// Résumé
// - Marque
// - Modèle
// - Review
// - Année de construction
// Fonctionnalités
// - Kilométrage
// - Boîte
// - Carburant
// - Places
