import 'package:flutter/material.dart';
import 'add_data_screen.dart';

class AddScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Burger King Hallmarks',
      'price': 'Rp.35.000,00',
      'image': 'assets/burger_halllmarks.jpg',
    },
    {
      'name': 'Teh Botol',
      'price': 'Rp.5.000,00',
      'image': 'assets/teh_botol.jpg',
    },
    {
      'name': 'Double Cheese burger',
      'price': 'Rp.55.000,00',
      'image': 'assets/double_cheese_burger.jpg',
    },
  ];

  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color:Colors.black ,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline),
                    foregroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            // Add Data Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductForm() )),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            // Table Header
            const Padding(
              padding:  EdgeInsets.all(16.0),
              child:  Row(
                children:  [
                  SizedBox(width: 60, child: Text('Foto'),),
                  Expanded(child: Text('Nama Produk')),
                  SizedBox(width: 100, child: Text('Harga')),
                  SizedBox(width: 50, child: Text('Aksi')),
                ],
              ),
            ),

            // Product List
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Product Image
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                products[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // Product Name
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                products[index]['name'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          // Price
                          SizedBox(
                            width: 100,
                            child: Text(
                              products[index]['price'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                          ),

                          // Delete Button
                          SizedBox(
                            width: 50,
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
