import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() => runApp(const RajangCruiseApp());

class RajangCruiseApp extends StatefulWidget {
  const RajangCruiseApp({super.key});

  @override
  State<RajangCruiseApp> createState() => _RajangCruiseAppState();
}

class _RajangCruiseAppState extends State<RajangCruiseApp> {
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuilds whenever the ViewModel calls notifyListeners()
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}