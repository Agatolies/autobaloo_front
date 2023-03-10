import 'package:autobaloo/core/constants.dart';
import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/views/components/car_chips.dart';
import 'package:autobaloo/views/components/new_banner.dart';
import 'package:autobaloo/views/format_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});

  factory CarCard.fromCar(Car car) {
    return CarCard(key: Key(car.id.toString()), car: car);
  }

  final Car car;

  @override
  Widget build(BuildContext context) {
    final model = car.carModel!;
    final modelImage = model.modelImages![0];

    return GestureDetector(
      onTap: () => context.pushNamed('car-detail',
          params: <String, String>{'id': car.id.toString()}),
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  EuropeanFormatter.formatPrice(car.carSalePrice),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'ou ${EuropeanFormatter.formatPrice(car.carReservationDailyPrice)} / jour en location',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                trailing: Visibility(
                    visible:
                        EuropeanFormatter.isAfter12152022(car.carDateAdded),
                    child: const NewBanner()),
              ),
              Container(
                constraints: const BoxConstraints(
                    minHeight: 240, maxHeight: 240, minWidth: double.infinity),
                child: Image.network(
                  '$apiRootEndpoint${modelImage.url}',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 50),
                child: ListTile(
                  title: Text(
                    model.modelName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    model.modelVariant,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: CarChips(car: car),
              ),
            ],
          )),
    );
  }
}

// - Utiliser des widgets Card et ListTile pour structurer le contenu de la carte. Cela permet d'avoir un rendu plus coh??rent et facile ?? maintenir.
// - Utiliser le widget Row et Column pour organiser le contenu de la carte de mani??re plus efficace. Par exemple, mettre le prix et la location dans une m??me ligne.
// - Utiliser des widgets Expanded et Flexible pour g??rer la r??partition de l'espace disponible entre les diff??rents ??l??ments de la carte.
// - Ajouter des s??parateurs entre les diff??rents ??l??ments de la carte avec le widget Divider.
// - Ajouter une image de fond ?? la carte avec le widget Container et lui donner un style avec un BoxDecoration.
// - Am??liorer l'accessibilit?? en utilisant des textes de remplacement pour les images et en ajoutant des attributs alt aux balises img.
// - Appliquer un th??me ?? l'application pour avoir un rendu plus harmonieux et coh??rent.
