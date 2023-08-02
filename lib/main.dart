import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = []; // 가상 상품 목록

  @override
  void initState() {
    super.initState();
    _fetchProducts(); // 앱이 시작될 때 제품 목록을 가져오도록 호출합니다.
  }

  // 제품 목록을 가져오는 함수
  void _fetchProducts() async {
    try {
      List<Product> products = await ApiService.fetchProducts();
      setState(() {
        _products = products;
      });
    } catch (e) {
      _showErrorDialog('오류', '제품 목록을 가져오는데 실패했습니다.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
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
            title: Text(_products[index].title),
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

  ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
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
    Navigator.pop(context, product);
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

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

  void _addProduct(BuildContext context) async {
    String name = _nameController.text;
    String priceStr = _priceController.text;
    double price = double.tryParse(priceStr) ?? 0;

    if (name.isNotEmpty && price > 0) {
      Product newProduct = Product(
        id: _generateProductId(),
        title: name,
        price: price,
        category: '', // Fill in the category value if you have it
        description: '', // Fill in the description value if you have it
        image: '', // Fill in the image URL if you have it
      );

      try {
        // Call the API to add the product
        Product addedProduct = await ApiService.addProduct(newProduct);

        Navigator.pop(context, addedProduct);
      } catch (e) {
        _showErrorDialog('오류', '제품을 추가하는데 실패했습니다.');
      }
    } else {
      _showErrorDialog('오류', '제품 이름과 가격을 올바르게 입력해주세요.');
    }
  }

  // A simple method to generate a unique product id for demonstration purposes
  int _generateProductId() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}

class _showErrorDialog {
  _showErrorDialog(String s, String t);
}

//통신 설정

class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }
}

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 201) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product');
    }
  }

  static Future<Product> deleteProduct(Product product) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/products/${product.id}'),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete product: ${response.statusCode}');
    }
  }
}
