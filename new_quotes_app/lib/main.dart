import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_quotes_app/quotes_app/quotes_app.dart';
import 'package:new_quotes_app/firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase. initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const QuotesApp());
}