import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  void _show(BuildContext context, String label) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$label pressed')));
  }

  Widget _button(BuildContext context, IconData icon, String label) {
    final color = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: () => _show(context, label),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _button(context, Icons.call, 'CALL'),
        _button(context, Icons.directions, 'ROUTE'),
        _button(context, Icons.share, 'SHARE'),
      ],
    );
  }
}