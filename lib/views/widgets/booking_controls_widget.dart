import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.visitDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2030),
    );
    if (picked != null) viewModel.setVisitDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Trip Preferences',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            // 1) Visit date picker
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cruise Date'),
              trailing: Text(viewModel.formattedDate,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => _pickDate(context),
            ),
            // 2) Cruise package dropdown
            ListTile(
              leading: const Icon(Icons.directions_boat),
              title: const Text('Package'),
              trailing: DropdownButton<String>(
                value: viewModel.selectedPackage,
                underline: const SizedBox(),
                items: viewModel.destination.packages
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: viewModel.setPackage,
              ),
            ),
            // 3) Dark mode switch
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.toggleDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}