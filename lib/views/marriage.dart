import 'package:flutter/material.dart';

class MarriagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Premium Reports',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse our Premium Reports',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              // Search Box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Marriage, career, etc.',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Category Tabs
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTab(context, 'Marriage', true),
                    _buildTab(context, 'Career', false),
                    _buildTab(context, 'Family', false),
                    _buildTab(context, 'Health', false),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Section Title
              Text(
                'Marriage',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 16),
              // Premium Reports List
              _buildReportCard(context),
              SizedBox(height: 16),
              _buildReportCard(context),
              SizedBox(height: 16),
              // Another Section (e.g., Career)
              Text(
                'Career',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 16),
              _buildReportCard(context),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildTab(BuildContext context, String title, bool isSelected) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
        if (isSelected)
          Container(
            height: 2,
            width: 30,
            color: Colors.blue,
          ),
      ],
    );
  }

  Widget _buildReportCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Rating Row
          Row(
            children: [
              // Image with rounded corners and border
              ClipRRect(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueAccent, width: 2), // Optional border
                  ),
                  child: Image.asset(
                    'assets/marriage.png', // Replace with actual image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Price and Rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹999.00',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                          '4.95/5',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Description
          Text(
            'Marriage Timing Prediction',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Discover the perfect timing for your marriage through the guidance of Vedic Astrology and an advanced AI-ML model.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 16),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton(context, 'View', Icons.visibility, Colors.grey),
              _buildButton(
                  context, 'Purchase', Icons.shopping_cart, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, IconData icon, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(text),
    );
  }
}
