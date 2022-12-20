import 'package:autobaloo/models/brand.dart';
import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/brand_service.dart';
import 'package:autobaloo/services/car_service.dart';
import 'package:autobaloo/views/components/brand_card_mini.dart';
import 'package:autobaloo/views/components/car_grid.dart';
import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:autobaloo/views/sections/hero_section.dart';
import 'package:autobaloo/views/sections/title_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Brand>> futureBrands;
  late Future<List<Car>> futureFeaturedCars;
  late Future<List<Car>> futureNewArrivalCars;

  @override
  void initState() {
    super.initState();
    futureBrands = sl.get<BrandService>().getAllBrands();
    futureFeaturedCars = sl.get<CarService>().getAllFeaturedCars();
    futureNewArrivalCars = sl.get<CarService>().getLatestCars();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
        //_buildTitleSection(),
        _buildHeroSection(),
        _buildCarsMonthlyOfferSection(),
        _buildCarsNewArrivalSection(),
      ],
    );
  }

  // Widget permettant de construire la section "héros" de la page d'accueil
  Widget _buildHeroSection() {
    return HeroSection(
        child: Column(children: [
      Container(
        alignment: Alignment.center,
        child: const Text(
          'Nos meilleures marques',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          softWrap: true,
        ),
      ),
      FutureBuilder(
        future: futureBrands,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final brandCards = snapshot.data!
                .map((brand) => BrandCardMini(brand: brand))
                .toList();
            return LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
              return GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (constraints.maxWidth >= 480) ? 6 : 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  primary: false,
                  padding: const EdgeInsets.all(30),
                  children: brandCards);
            });
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: ElevatedButton(
            onPressed: () => GoRouter.of(context).goNamed('catalog'),
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
                Text('Tous nos véhicules'),
                Icon(Icons.arrow_circle_right_outlined),
              ],
            )),
      ),
    ]));
  }

  Widget _buildCarsMonthlyOfferSection() {
    return PageSection(
      titleEvent: 'Offres du mois',
      iconEvent: Icons.local_fire_department,
      widget: FutureBuilder<List<Car>>(
          future: futureFeaturedCars,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarGrid(cars: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  Widget _buildCarsNewArrivalSection() {
    return PageSection(
      titleEvent: 'Nos nouveautés',
      iconColor: Colors.blue,
      widget: FutureBuilder<List<Car>>(
          future: futureNewArrivalCars,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarGrid(cars: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
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
}
