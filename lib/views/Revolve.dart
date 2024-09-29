import 'package:flutter/material.dart';
import 'dart:math';

class RevolvingIconsPage extends StatefulWidget {
  @override
  _RevolvingIconsPageState createState() => _RevolvingIconsPageState();
}

class _RevolvingIconsPageState extends State<RevolvingIconsPage>
    with SingleTickerProviderStateMixin {
  double _rotationAngle = 0.0;
  final double _radius = 120.0;

  final List<IconData> icons = [
    Icons.business,
    Icons.work,
    Icons.favorite,
    Icons.family_restroom,
    Icons.health_and_safety,
  ];

  final List<String> labels = [
    'Business',
    'Career',
    'Marriage',
    'Family',
    'Health',
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      // Invert the direction of the rotation to make it feel intuitive
      _rotationAngle -= details.delta.dx / 150; // Adjust sensitivity as needed
    });
  }

  void _onIconTap(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped on: ${labels[index]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onPanUpdate: _onPanUpdate, // Detect drag updates for smooth rotation
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: OrbitPainter(),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.white, Colors.yellow[300]!],
                  ),
                ),
              ),
            ),
            Stack(
              children: List.generate(icons.length, (index) {
                final angle = 2 * pi * index / icons.length + _rotationAngle;
                final x = cos(angle) * _radius;
                final y = sin(angle) * _radius;

                return Positioned(
                  left: MediaQuery.of(context).size.width / 2 + x - 30,
                  top: MediaQuery.of(context).size.height / 2 + y - 30,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _onIconTap(index),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icons[index], color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(labels[index],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              }),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Text(
                'Personal App',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrbitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(center, 80.0 * i, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
