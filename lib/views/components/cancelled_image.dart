import 'package:flutter/cupertino.dart';

class CancelledImage extends StatelessWidget {
  const CancelledImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: 500,
        width: 500,
        child: Image.asset('images/cancelled.jpg'),
      ),
    );
  }
}