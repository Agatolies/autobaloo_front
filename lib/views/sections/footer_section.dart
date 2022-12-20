import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 30),
              SizedBox(height: 5),
              Text('Adresse de AutoBaloo'),
              SizedBox(height: 5),
              Text('Rue de la société, 1'),
              Text('1000 Bruxelles'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone, size: 30),
              SizedBox(height: 5),
              Text('Téléphone'),
              SizedBox(height: 5),
              Text('(+32) 123 45 67 89'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.email, size: 30),
              SizedBox(height: 5),
              Text('Email'),
              SizedBox(height: 5),
              Text('info@autobaloo.com'),
            ],
          ),
        ],
      ),
    );
  }
}
