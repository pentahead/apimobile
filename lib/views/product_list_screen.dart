import 'package:flutter/material.dart';
import 'package:apimobile/controllers/product.dart';
import 'package:apimobile/models/Mproduct.dart';
import 'package:apimobile/views/product_detail_screen.dart'; // Pastikan untuk mengimpor halaman detail produk

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> futureProducts;
  final ProductController _controller = ProductController();

  @override
  void initState() {
    super.initState();
    futureProducts = _controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 49, 79),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Produk Tidak Tersedia'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    tileColor: index % 2 == 0
                        ? Color.fromARGB(255, 203, 231, 253)
                        : Color.fromARGB(255, 18, 192, 201),
                    leading: Icon(Icons.shopping_cart,
                        color: Theme.of(context).primaryColor),
                    title: Text(product.name,
                        style: TextStyle(color: Colors.black)),
                    trailing: Text(
                      product.data?.price?.toStringAsFixed(2) ?? 'Sold Out',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product)),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
