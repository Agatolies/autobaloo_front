import 'package:autobaloo/core/constants.dart';
import 'package:autobaloo/models/brand.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// class BrandCardMini extends StatelessWidget {
//   const BrandCardMini({
//     required this.brand,
//     Key? key,
//   }) : super(key: key);
//
//   final Brand brand;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (brand.brandLogo != null)
//               Container(
//                 height: 150,
//                 width: 150,
//                 child: CachedNetworkImage(
//                   imageUrl: '$apiRootEndpoint${brand.model!.brandLogo!.url}',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             Container(
//               padding: const EdgeInsets.only(top: 16),
//               child: Text(
//                 brand.brandName ?? '',
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BrandCardMini extends StatelessWidget {
  const BrandCardMini({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(4),
        ),
        child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
          final bool isDesktop = constraints.maxWidth >= 600;

          return Padding(
              padding: EdgeInsets.all(isDesktop ? 20 : 6),
              child: Tooltip(
                  message: brand.brandName!,
                  child: CachedNetworkImage(
                    imageUrl: '$apiRootEndpoint${brand.model!.brandLogo!.url}',
                    fit: BoxFit.fitWidth,
                  )));
        }));
  }
}
