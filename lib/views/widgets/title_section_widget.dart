import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int rating;
  final VoidCallback onStarTap;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(location,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
          // Tap to increase the star count
          InkWell(
            onTap: onStarTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.withAlpha(40),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text('$rating',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}