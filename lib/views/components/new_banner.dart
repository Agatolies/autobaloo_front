import 'package:flutter/material.dart';

class NewBanner extends StatelessWidget {
  const NewBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/banner_new.jpg',
      width: 50,
      height: 30,
      fit: BoxFit.cover,
    );
  }
}
