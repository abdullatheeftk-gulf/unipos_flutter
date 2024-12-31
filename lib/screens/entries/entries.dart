import 'package:flutter/material.dart';
import 'package:unipos_flutter/screens/common_widgets/menu_card.dart';
import 'package:unipos_flutter/util/routes.dart';

class Entries extends StatefulWidget {
  const Entries({super.key});

  @override
  State<Entries> createState() => _EntriesState();
}

class _EntriesState extends State<Entries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            MenuCard(
              title: "Sales",
              leadingIcon: Icon(Icons.point_of_sale),
              onTap: () {
                Navigator.pushNamed(context, sales);
              },
            ),
            const SizedBox(height: 10),
            MenuCard(
              title: "Sales Returns",
              leadingIcon: Icon(Icons.undo),
              onTap: () {
                //TODO: Navigate to Sales Returns
              },
            ),
            const SizedBox(height: 10),
            MenuCard(
                title: "Expenses",
                leadingIcon: Icon(Icons.money_off),
                onTap: () {}),
            const SizedBox(height: 10),
            MenuCard(
              title: "Purchase",
              leadingIcon: Icon(Icons.shopping_cart),
              onTap: () {
                // TODO: Navigate to Purchase
              },
            ),
          ],
        ),
      ),
    );
  }
}
