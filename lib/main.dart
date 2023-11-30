// import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String _name;
  double _price;
  String _description;
  int _quantity;
  int _stock;

  Product(this._name, this._price, this._description, this._quantity, this._stock);

  String get name => _name;
  set name(String newName) => _name = newName;

  double get price => _price;
  set price(double newPrice) => _price = newPrice;

  String get description => _description;
  set description(String newDescription) => _description = newDescription;

  int get quantity => _quantity;
  set quantity(int newQuantity) => _quantity = newQuantity;

  int get stock => _stock;
  set stock(int newStock) => _stock = newStock;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gerenciador de Produtos'),
        ),
        body: AddProductScreen(),
      ),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final requirementsController = TextEditingController();
  final lowerLimitController = TextEditingController();
  final upperLimitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: productNameController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um nome válido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: productDescriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma descrição válida';
                }
                return null;
              },
            ),
            TextFormField(
              controller: requirementsController,
              decoration: InputDecoration(labelText: 'Preço'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um preço válido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lowerLimitController,
              decoration: InputDecoration(labelText: 'Quantidade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma quantidade válida';
                }
                return null;
              },
            ),
            TextFormField(
              controller: upperLimitController,
              decoration: InputDecoration(labelText: 'Quantidade em estoque'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma quantidade válida';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Produto adicionado com sucesso!')),
                  );
                }
              },
              child: Text('Adicionar produto'),
            ),
          ],
        ),
      ),
    );
  }
}