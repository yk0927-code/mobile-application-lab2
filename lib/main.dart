import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  const StudentInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSS3344 Lab 02',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const StudentProfileScreen(),
    );
  }
}

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSS3344 Mobile App Dev - Lab 02'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade200,
              Colors.purple.shade100,
              Colors.pink.shade100,
            ],
          ),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildPortraitView()
                : _buildLandscapeView();
          },
        ),
      ),
    );
  }

  Widget _buildPortraitView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shadowColor: Colors.purple.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._buildOriginalProfileContent(),
                  const SizedBox(height: 16),
                  const PickerSection(),
                  const SizedBox(height: 16),
                  const TitleSection(
                    name: 'University Of Technology Sarawak',
                    location: 'Sibu, Sarawak',
                    starCount: 41,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/1.jpg',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLandscapeView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.purple.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left Side: Original Profile Content + Pickers
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ..._buildOriginalProfileContent(),
                      const SizedBox(height: 12),
                      const PickerSection(),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Right Side: TitleSection + Fitted Location Image
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const TitleSection(
                      name: 'University Of Technology Sarawak',
                      location: 'Sibu, Sarawak',
                      starCount: 41,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/1.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOriginalProfileContent() {
    return [
      Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.pink, Colors.orange],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 3,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
            'assets/profile.jpg',
          ),
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'HUONG YEW KONG',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        'Student ID: BCS24090051',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Personal Life Goal / Quote:',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.pink,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade50,
              Colors.deepPurple.shade50,
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.pink.shade200,
            width: 1,
          ),
        ),
        child: const Text(
          '"To learn more, gain knowledge, '
          'and improve my skills day by day."',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
  }
}

class PickerSection extends StatefulWidget {
  const PickerSection({super.key});

  @override
  State<PickerSection> createState() => _PickerSectionState();
}

class _PickerSectionState extends State<PickerSection> {
  DateTime? _selectedDate;
  String _selectedRole = 'Student';

  // 1. Material Date Picker
  Future<void> _selectMaterialDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // 2. Cupertino Date Picker (Modal Sheet)
  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 240,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _selectedDate ?? DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() => _selectedDate = newDate);
          },
        ),
      ),
    );
  }

  // 4. Selection Pickers: Cupertino Picker (Wheel)
  void _showCupertinoRolePicker(BuildContext context) {
    final List<String> roles = ['Student', 'Developer', 'Designer'];
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPicker(
          itemExtent: 32,
          scrollController: FixedExtentScrollController(
            initialItem: roles.contains(_selectedRole) ? roles.indexOf(_selectedRole) : 0,
          ),
          onSelectedItemChanged: (int index) {
            setState(() => _selectedRole = roles[index]);
          },
          children: roles.map((role) => Center(child: Text(role))).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String dateText = _selectedDate == null
        ? 'No Date Selected'
        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepPurple.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pickers & Selection',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),

          // Date Selection Label
          Text(
            'Date: $dateText',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade50,
                    foregroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                  icon: const Icon(Icons.date_range, size: 16),
                  label: const Text('Material Date', style: TextStyle(fontSize: 11)),
                  onPressed: () => _selectMaterialDate(context),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade50,
                    foregroundColor: Colors.pink.shade800,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                  icon: const Icon(CupertinoIcons.calendar, size: 16),
                  label: const Text('Cupertino Date', style: TextStyle(fontSize: 11)),
                  onPressed: () => _showCupertinoDatePicker(context),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(height: 1),
          ),

          // Role Selection Label
          Text(
            'Role: $_selectedRole',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 3. Material DropdownButton
              Row(
                children: [
                  const Text('Dropdown: ', style: TextStyle(fontSize: 12)),
                  DropdownButton<String>(
                    value: _selectedRole,
                    isDense: true,
                    items: ['Student', 'Developer', 'Designer'].map((String role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role, style: const TextStyle(fontSize: 12)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _selectedRole = newValue);
                      }
                    },
                  ),
                ],
              ),

              // 4. Cupertino Role Wheel Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  foregroundColor: Colors.purple.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                icon: const Icon(CupertinoIcons.list_bullet, size: 16),
                label: const Text('Cupertino Wheel', style: TextStyle(fontSize: 11)),
                onPressed: () => _showCupertinoRolePicker(context),
              ),
            ],
          ),
        ],
      ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade50,
            Colors.pink.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.deepPurple.shade100,
          width: 1.5,
        ),
      ),
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
                    fontSize: 14,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.location,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              _isStarred ? Icons.star : Icons.star_border,
              color: Colors.pinkAccent,
              size: 24,
            ),
            onPressed: _toggleStar,
          ),
          const SizedBox(width: 4),
          Text(
            '$_count',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
