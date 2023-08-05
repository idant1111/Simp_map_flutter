import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController _varValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter the var value')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _varValueController,
              decoration: InputDecoration(labelText: 'Enter var value'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String varValue = _varValueController.text.trim();
                if (varValue.isNotEmpty) {
                  Navigator.pushNamed(context, '/map', arguments: varValue);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter the var value')),
                  );
                }
              },
              child: Text('Continue to Map'),
            ),
          ],
        ),
      ),
    );
  }
}
