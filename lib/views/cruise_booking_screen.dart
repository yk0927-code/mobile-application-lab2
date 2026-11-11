import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final dest = viewModel.destination;

    final header = HeaderImageWidget(
      imagePath: dest.imagePath,
      caption: dest.imageCaption,
    );
    final title = TitleSectionWidget(
      name: dest.name,
      location: dest.location,
      rating: viewModel.rating,
      onStarTap: viewModel.incrementRating,
    );
    const actionBar = ActionBarWidget();
    final description = DescriptionWidget(text: dest.description);
    final controls = BookingControlsWidget(viewModel: viewModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // Portrait: single scrolling column
            return ListView(
              children: [header, title, actionBar, description, controls],
            );
          }
          // Landscape: image on the left, scrolling details on the right
          return Row(
            children: [
              Expanded(
                child: HeaderImageWidget(
                  imagePath: dest.imagePath,
                  caption: dest.imageCaption,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [title, actionBar, description, controls],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}