import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoBalooLogo extends StatelessWidget {
  const AutoBalooLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).goNamed('home'),
      child: Text(
        'AutoBaloo',
        style: GoogleFonts.satisfy(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }
}
