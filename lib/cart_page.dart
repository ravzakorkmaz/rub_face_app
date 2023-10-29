import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        //backgroundColor: Color.fromARGB(255, 215, 165, 187),
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Warenkorb"),
          centerTitle: true,
        ),*/
        appBar: MyAppBar(myTitle: 'W A R E N K O R B'),
        body: Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 25.0),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  if (cartModel.nudelsuppe > 0)
                    Container(
                      decoration: BoxDecoration(
                        //color: Color.fromARGB(255, 61, 91, 212),
                        color: Color.fromARGB(255, 146, 192, 29),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          "Noodle Harmony",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "€ 18,00",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cartModel.nudelsuppe.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: cartModel.clearNudelsuppe,
                              icon: Icon(Icons.delete, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 15),
                  if (cartModel.festival > 0)
                    Container(
                      decoration: BoxDecoration(
                        //color: Color.fromARGB(255, 61, 91, 212),
                        color: Color.fromARGB(255, 146, 192, 29),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          "Mitama Matsuri Festival",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "€ 49,00",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cartModel.festival.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: cartModel.clearFestival,
                              icon: Icon(Icons.delete, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 23, 54, 92),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        "TOTAL",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        cartModel.totalItems.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cartModel.festival.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: cartModel.clearFestival,
                            icon: Icon(Icons.delete, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
