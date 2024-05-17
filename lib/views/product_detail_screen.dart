import 'package:flutter/material.dart';
import 'package:apimobile/models/Mproduct.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(
              color: Colors.white), // Mengatur warna teks judul menjadi putih
        ),
        backgroundColor: const Color.fromARGB(
            255, 12, 49, 79), // Warna background AppBar biru tua
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Detail Produk:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: product.data != null
                  ? ListView(
                      shrinkWrap: true,
                      children: product.data!.toJson().entries.map((entry) {
                        return ListTile(
                          title: Text(entry.key),
                          subtitle: Text(entry.value.toString()),
                        );
                      }).toList(),
                    )
                  : Text('Tidak ada data', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
