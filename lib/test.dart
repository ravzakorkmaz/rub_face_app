import 'package:flutter/material.dart';
import 'package:rub_face_app/prod_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produktliste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  // Hier können Sie eine Liste von Produktinformationen erstellen.
  List<Map<String, dynamic>> products = [
    {
      'name': 'Produkt 1',
      'description': 'Beschreibung für Produkt 1.',
      'price': 19.99,
    },
    {
      'name': 'Produkt 2',
      'description': 'Beschreibung für Produkt 2.',
      'price': 29.99,
    },
    // Fügen Sie hier weitere Produkte hinzu...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produktliste'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text('\$${products[index]['price']}'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdPage(product: products[index]),
                  ));
              // Hier können Sie die Produktdetailseite aufrufen.
              // Zum Beispiel: Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product: products[index])));
            },
          );
        },
      ),
    );
  }
}
