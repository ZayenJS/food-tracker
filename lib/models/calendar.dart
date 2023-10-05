class CalendarModel {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void nextDay() {
    _selectedDate = _selectedDate.add(const Duration(days: 1));
  }

  void previousDay() {
    _selectedDate = _selectedDate.subtract(const Duration(days: 1));
  }
}
