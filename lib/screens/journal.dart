import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_tracker/widgets/food_day.dart';
import 'package:intl/intl.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late PageController _pageController;
  final int _initialPage = 100000; // Set a large initial page value
  DateTime _currentDate = DateTime.now();
  final Map<int, String> _dataCache = {}; // Cache for loaded data

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  Future<String> fetchDataForDate(DateTime date) {
    // random milliseconds between 100 and 1000
    final int randomDelay = Random().nextInt(900) + 100;
    // Simulate fetching data based on the provided date
    return Future.delayed(Duration(milliseconds: randomDelay), () {
      return "Data for ${DateFormat('yyyy-MM-dd').format(date)}";
    });
  }

  void _onPreviousDay() {
    _pageController.animateToPage(
      _pageController.page!.toInt() - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNextDay() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  String _humanizeDate(DateTime date) {
    final String now = DateFormat("dd/MM/yyyy").format(DateTime.now());
    final String tomorrow = DateFormat("dd/MM/yyyy")
        .format(DateTime.now().add(const Duration(days: 1)));
    final String yesterday = DateFormat("dd/MM/yyyy")
        .format(DateTime.now().subtract(const Duration(days: 1)));

    final String dateStr = DateFormat("dd/MM/yyyy").format(date);

    if (dateStr == now) {
      return "Aujourd'hui";
    } else if (dateStr == tomorrow) {
      return "Demain";
    } else if (dateStr == yesterday) {
      return "Hier";
    }

    return DateFormat("EEEE dd MMM").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Journal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _onPreviousDay,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Text(
                _humanizeDate(_currentDate),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: _onNextDay,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          // Calculate the date for the current page
          DateTime currentPageDate =
              DateTime.now().add(Duration(days: index - _initialPage));

          // Check if data is already cached for this date
          if (_dataCache.containsKey(index)) {
            return FoodDay(data: _dataCache[index]!);
          } else {
            // Load data dynamically for this date and cache it
            fetchDataForDate(currentPageDate).then((data) {
              setState(() {
                _dataCache[index] = data;
              });
            });

            return const Center(
              child: CircularProgressIndicator(),
            ); // Show loading indicator while data is being loaded
          }
        },
        onPageChanged: (index) {
          // Update the selected date directly without using a listener
          DateTime newDate =
              DateTime.now().add(Duration(days: index - _initialPage));
          setState(() {
            _currentDate = newDate;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
