import 'package:flutter/material.dart';
import 'package:rub_face_app/components/product_info.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductInfo(
        barTitle: "FIRST PRODUCT",
        imagePath: "lib/images/japan3.png",
        rating: "3,0",
        productName: "OUR FIRST PRODUCT",
        description: "This is a test of our very nice first product.",
        price: "€ 3");
  }
}
