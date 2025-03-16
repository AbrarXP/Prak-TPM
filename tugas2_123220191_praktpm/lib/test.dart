import 'package:flutter/material.dart';
import 'package:kuis_f/data/clothes_data.dart';

class ClothesListScreen extends StatelessWidget {
  const ClothesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Pakaian'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: clothesList.length,
        itemBuilder: (context, index) {
          final item = clothesList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar produk
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Informasi produk
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Brand: ${item.brand}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              'Kategori: ${item.category}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(' ${item.rating}'),
                                const SizedBox(width: 8),
                                Text('Terjual: ${item.sold}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Bagian harga
                  Text(
                    'Harga: \$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  // Bagian ukuran
                  const SizedBox(height: 4),
                  Text('Ukuran:'),
                  Wrap(
                    spacing: 5,
                    children: item.sizes.map((size) {
                      return Chip(
                        label: Text(size),
                        backgroundColor: Colors.blue[100],
                        labelStyle: const TextStyle(fontSize: 12),
                        visualDensity: VisualDensity.comfortable,
                      );
                    }).toList(),
                  ),
                  // Bagian warna
                  const SizedBox(height: 4),
                  Text('Warna:'),
                  Wrap(
                    spacing: 5,
                    children: [
                      for (String color in item.colors)
                        Chip(
                          label: Text(color),
                          backgroundColor: Colors.pink[100],
                          labelStyle: const TextStyle(fontSize: 12),
                          visualDensity: VisualDensity.comfortable,
                        )
                    ]
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}