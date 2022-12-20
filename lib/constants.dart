import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// The desktop top padding for a page's first header (e.g. Gallery, Settings)
const firstHeaderDesktopTopPadding = 5.0;

// API constants (Strapi)
const apiScheme = 'http';
const apiPort = 1337;
const apiAuthToken = null;

final apiHost = (!kIsWeb && Platform.isAndroid) ? '10.0.2.2' : 'localhost';
final apiRootEndpoint = '$apiScheme://$apiHost:$apiPort';
final apiEndpoint = '$apiRootEndpoint/api';
