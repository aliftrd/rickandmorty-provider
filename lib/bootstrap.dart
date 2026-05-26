import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  var logger = Logger();
  FlutterError.onError = (details) {
    logger.d(details.exception.toString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('Uncaught error: $error', stackTrace: stack);
    return true;
  };

  final appBuilder = await builder();

  runApp(appBuilder);
}
