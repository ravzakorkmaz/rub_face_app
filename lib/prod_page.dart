import 'package:flutter/material.dart';

class ProdPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProdPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beschreibung:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(product['description']),
            SizedBox(height: 16),
            Text(
              'Preis: \$${product['price']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Weitere Details hinzufügen...
          ],
        ),
      ),
    );
  }
}
