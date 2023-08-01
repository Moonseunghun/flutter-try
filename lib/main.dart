import 'package:flutter/material.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> _products = []; // 가상 상품 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce App'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_products[index].name),
            subtitle: Text('${_products[index].price}원'),
            onTap: () {
              _navigateToProductDetails(context, _products[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddProduct(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToProductDetails(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  void _navigateToAddProduct(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductPage(),
      ),
    );
    if (result != null && result is Product) {
      setState(() {
        _products.add(result);
      });
    }
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${product.price}원'),
            ElevatedButton(
              onPressed: () {
                _deleteProduct(context, product);
              },
              child: Text('제품 삭제'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteProduct(BuildContext context, Product product) {
    // 여기에서 실제로 데이터베이스와 통신하여 제품을 삭제하는 로직을 작성해야 합니다.
    // 예시로 가상 제품 목록에서 제품 삭제
    Navigator.pop(context, product);
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제품 추가'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: '제품 이름'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: '제품 가격'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addProduct(context);
              },
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }

  void _addProduct(BuildContext context) {
    String name = _nameController.text;
    String priceStr = _priceController.text;
    int price = int.tryParse(priceStr) ?? 0;

    if (name.isNotEmpty && price > 0) {
      Product newProduct = Product(name: name, price: price);
      Navigator.pop(context, newProduct);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('오류'),
            content: Text('제품 이름과 가격을 올바르게 입력해주세요.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }
}

class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}
