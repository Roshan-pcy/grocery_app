import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/CardHomePage.dart';
import 'package:grocery/pages/CardItemCard.dart';
import 'package:grocery/pages/provider/card_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        },
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Good moring"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Let's Order fresh items for you",
              style: GoogleFonts.notoSerif(
                  fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Fresh Items",
              style: GoogleFonts.notoSerif(
                  fontSize: 10, fontWeight: FontWeight.w700)),
        ),
        Consumer<CardProvider>(
          builder: (context, value, child) {
            return Expanded(
                child: GridView.builder(
              itemCount: value.shopItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Carditemcard(
                  onPressed: () {
                    Provider.of<CardProvider>(context, listen: false)
                        .addItemToCart(index);
                  },
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                );
              },
            ));
          },
        )
      ])),
    );
  }
}
