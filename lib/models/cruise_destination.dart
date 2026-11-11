/// MODEL layer: pure data class, no UI and no state logic.
class CruiseDestination {
  final String name;
  final String location;
  final String imageCaption;
  final String imagePath;
  final String description;
  final int initialRating;
  final List<String> packages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.imageCaption,
    required this.imagePath,
    required this.description,
    required this.initialRating,
    required this.packages,
  });

  /// Sample data used by the ViewModel.
  factory CruiseDestination.sample() {
    return const CruiseDestination(
      name: 'Rajang River Express Cruise',
      location: 'Sibu Waterfront, Sarawak',
      imageCaption: 'Rajang River Horizon',
      imagePath: 'assets/images/rajang.jpg',
      description:
      'Experience the heart of Sibu along Malaysia\'s longest river, the '
          'Rajang. Cruise past historic temples, timber hubs, and waterfront '
          'settlements while experiencing authentic Sarawakian hospitality.',
      initialRating: 43,
      packages: [
        'Private River Cruise',
        'Sunset Cruise',
        'Sunrise Cruise',
        'Rural Cruise',
        'SMI Park Cruise',
      ],
    );
  }
}