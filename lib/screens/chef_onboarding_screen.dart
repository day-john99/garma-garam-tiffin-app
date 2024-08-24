import 'package:flutter/material.dart';

void main() {
  runApp(ThaliApp());
}

class ThaliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thali App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ThaliFormPage(),
    );
  }
}

class ThaliFormPage extends StatefulWidget {
  @override
  _ThaliFormPageState createState() => _ThaliFormPageState();
}

class _ThaliFormPageState extends State<ThaliFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _thaliNameController = TextEditingController();
  final _thaliContentsController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _thaliNameController.dispose();
    _thaliContentsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final thaliName = _thaliNameController.text;
      final thaliContents = _thaliContentsController.text;
      final price = _priceController.text;

      // You can handle the submission logic here, e.g., save to a database or show a dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thali Submitted'),
          content: Text('Name: $thaliName\nContents: $thaliContents\nPrice: $price'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Ensure you add a background image in your assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white.withOpacity(0.5),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _thaliNameController,
                          decoration: InputDecoration(
                            labelText: 'Thali Name',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a thali name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _thaliContentsController,
                          decoration: InputDecoration(
                            labelText: 'Thali Contents',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter thali contents';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the price';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Submit'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            backgroundColor: Colors.teal,
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
