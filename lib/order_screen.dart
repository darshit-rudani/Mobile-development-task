import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app_drawer.dart';
import 'package:provider/provider.dart';
import 'order_item.dart';
import 'orders.dart' show Orders;

class OrderScreen extends StatelessWidget {

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
      drawer: AppDrawer(),
    );
  }
}
