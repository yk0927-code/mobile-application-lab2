import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

/// VIEWMODEL layer: holds state + business logic, notifies the View.
class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = CruiseDestination.sample();

  late int _rating = destination.initialRating;
  DateTime _visitDate = DateTime.now();
  late String _selectedPackage = destination.packages.first;
  bool _isDarkMode = false;

  int get rating => _rating;
  DateTime get visitDate => _visitDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  /// dd/MM/yyyy (no intl package needed)
  String get formattedDate {
    final d = _visitDate.day.toString().padLeft(2, '0');
    final m = _visitDate.month.toString().padLeft(2, '0');
    return '$d/$m/${_visitDate.year}';
  }

  void incrementRating() {
    _rating++;
    notifyListeners();
  }

  void setVisitDate(DateTime date) {
    _visitDate = date;
    notifyListeners();
  }

  void setPackage(String? value) {
    if (value == null) return;
    _selectedPackage = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}