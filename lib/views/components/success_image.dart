import 'package:flutter/cupertino.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 500,
        width: 500,
        child: Image.asset('images/success.jpg'),
      ),
    );
  }
}