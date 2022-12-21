import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/services/car_service.dart';
import 'package:autobaloo/views/components/car_card.dart';
import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({super.key});

  final CarService carService = CarService();

  @override
  State<CatalogPage> createState() => _Catalog();
}

class _Catalog extends State<CatalogPage> {
  final _buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(children: <Widget>[
      _buildTitleSection(),
      const SizedBox(height: 20),
      // _buildSearchCarsSection(),
      const SizedBox(height: 20),
      _buildCarCarouselSection(),
      const SizedBox(height: 20),
      _buildCarCatalogTable(),
      // _buildRentOrBuySection(),
    ]);
  }

  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Trouvez votre prochaine voiture',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Text(
                  "Découvrez notre large sélection de voitures neuves et d'occasion à la vente et à la location",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: 120,
            child: Image.asset('images/ab-ambiant1.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCarouselSection() {
    return FutureBuilder<List<Car>>(
      future: widget.carService.getAllCars(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  double viewportFraction = 0.8;
                  if (constraints.maxWidth > 800) {
                    viewportFraction = 0.4;
                  }
                  return CarouselSlider(
                    items: snapshot.data!.map(CarCard.fromCar).toList(),
                    carouselController: _buttonCarouselController,
                    options: CarouselOptions(
                      height: 490,
                      viewportFraction: viewportFraction,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: _buttonCarouselController.previousPage,
                    child: const Icon(Icons.chevron_left),
                  ),
                  MaterialButton(
                    onPressed: _buttonCarouselController.nextPage,
                    child: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildCarCatalogTable() {
    return Center(
      child: Card(
        child: FutureBuilder<List<Car>>(
          future: widget.carService.getAllCars(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Marque'),
                    ),
                    DataColumn(
                      label: Text('Modèle'),
                    ),
                    DataColumn(
                      label: Text('Numéro de plaque'),
                    ),
                    DataColumn(
                      label: Text('Couleur'),
                    ),
                    DataColumn(
                      label: Text('Disponibilité'),
                    ),
                    DataColumn(
                      label: Text('Kilométrage'),
                    ),
                  ],
                  rows: snapshot.data!
                      .map((car) => DataRow(
                            cells: [
                              DataCell(
                                  Text(car.carModel?.brand?.brandName ?? '')),
                              DataCell(Text(car.carModel?.modelName ?? '')),
                              DataCell(Text(car.carPlateNumber)),
                              DataCell(Text(car.carColor)),
                              DataCell(Text(car.carAvailability.toString())),
                              DataCell(Text(car.carKilometers.toString())),
                            ],
                          ))
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

//Barre de recherche
// Liste des marques + filtre
// Cartes des voitures (avec pagination /10)
// Bouton qui permet de remonter tout en haut
