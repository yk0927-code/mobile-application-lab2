import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Layout'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView()
              : _buildLandscapeView();
        },
      ),
    );
  }

  Widget _buildPortraitView() {
    return ListView(
      children: const [
        ImageSection(imagePath: 'assets/images/1.jpg'),
        TitleSection(
          name: 'University of Technology Sarawak',
          location: 'Sibu, Sarawak',
          starCount: 41,
        ),
        ActionButtonsSection(),
        TextSection(),
      ],
    );
  }

  Widget _buildLandscapeView() {
    return Row(
      children: [
        const Expanded(
          child: ImageSection(imagePath: 'assets/images/1.jpg'),
        ),
        Expanded(
          child: ListView(
            children: const [
              TitleSection(
                name: 'University Of Technology Sarawak',
                location: 'Sibu, Sarawak',
                starCount: 41,
              ),
              ActionButtonsSection(),
              TextSection(),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageSection extends StatelessWidget {
  final String imagePath;

  const ImageSection({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatefulWidget {
  final String name;
  final String location;
  final int starCount;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
  });

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  late int _count;
  bool _isStarred = true;

  @override
  void initState() {
    super.initState();
    _count = widget.starCount;
  }

  void _toggleStar() {
    setState(() {
      if (_isStarred) {
        _count -= 1;
        _isStarred = false;
      } else {
        _count += 1;
        _isStarred = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.location,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              _isStarred ? Icons.star : Icons.star_border,
              color: Colors.red[500],
              size: 28,
            ),
            onPressed: _toggleStar,
          ),
          Text(
            '$_count',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'University of Technology Sarawak (UTS) is a state-owned university located in Sibu, Sarawak, Malaysia. '
        'Established to provide quality education and research opportunities in engineering, technology, '
        'business, and computing, UTS is renowned for its modern green campus architecture and commitment '
        'to producing skilled graduates for the region and beyond.',
        softWrap: true,
      ),
    );
  }
}
