import 'package:flutter/material.dart';

class check_out_screen extends StatefulWidget {
  const check_out_screen({super.key});

  @override
  State<check_out_screen> createState() => _check_out_screenState();
}

class _check_out_screenState extends State<check_out_screen> {
  // Item list with quantity and price
  List<Item> items = [
    Item(name: "Rolex", color: "Black", size: "L", price: 51, quantity: 1),
    Item(name: "Casio", color: "Gray", size: "L", price: 30, quantity: 1),
    Item(name: "Fossil", color: "Black", size: "M", price: 43, quantity: 1),
  ];

  // Method to calculate the total amount
  int calculateTotalAmount() {
    int total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildCartItem(items[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Total amount:                                      \$${calculateTotalAmount()}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Congratulations! You have checked out.'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Checkout button color
                    padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  ),
                  child: const Text(
                    "CHECK OUT",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget for each cart item
  Widget buildCartItem(Item item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Image.asset(
              'assets/images/watch.jpeg'), // Replace with actual image
          title: Text(item.name),
          subtitle: Text("Color: ${item.color}, Size: ${item.size}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (item.quantity > 1) {
                      item.quantity--;
                    }
                  });
                },
              ),
              Text("${item.quantity}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    item.quantity++;
                  });
                },
              ),
              Text("\$${item.price}"),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String name;
  String color;
  String size;
  int price;
  int quantity;

  Item(
      {
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  }
  );
}

