import 'package:url_launcher/url_launcher.dart';

Map<dynamic, dynamic> list2Map(List<dynamic> list) {
  final Map<dynamic, dynamic> result = {};

  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      result[i.toString()] = list[i] is List ? list2Map(list[i]) : list[i];
    }
  }

  return result;
}

Future<void> openUrl(int price) async {
  final String url =
      'https://www.paypal.com/paypalme/ldeste/${price}eur';
  final uri = Uri.parse(url);

  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}