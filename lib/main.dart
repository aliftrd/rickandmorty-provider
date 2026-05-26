import 'package:flutter/material.dart';
import 'package:rickandmorty/bootstrap.dart';
import 'package:rickandmorty/core/di/injector.dart';
import 'package:rickandmorty/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  bootstrap(() => const MyApp());
}
