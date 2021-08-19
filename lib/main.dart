import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/cart_screen.dart';
import 'package:flutter_complete_guide/order_screen.dart';
import 'package:flutter_complete_guide/orders.dart';
import 'package:flutter_complete_guide/product_detail_screen.dart';
import 'package:flutter_complete_guide/products.dart';
import 'package:flutter_complete_guide/sign_up.dart';
import 'package:provider/provider.dart';
import './products_overview_screen.dart';
import 'cart.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          SignUp.routeName: (ctx) => SignUp(),
        },
      ),
    );
  }
}
