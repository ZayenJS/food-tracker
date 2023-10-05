import 'package:flutter/material.dart';
import 'package:food_tracker/screens/journal.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("EEEE dd MMM");

void main() {
  initializeDateFormatting('fr_FR');
  Intl.defaultLocale = 'fr_FR';
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Tracker',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey,
      ),
      home: const JournalScreen(),
    );
  }
}
