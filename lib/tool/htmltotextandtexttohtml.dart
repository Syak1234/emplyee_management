import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HtmlProcessorPage(),
    );
  }
}

class HtmlProcessorPage extends StatefulWidget {
  @override
  _HtmlProcessorPageState createState() => _HtmlProcessorPageState();
}

class _HtmlProcessorPageState extends State<HtmlProcessorPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  bool _sortAlphabetically = false;
  bool _sortReverse = false;

  void _processText() {
    final inputText = _inputController.text;
    final sortAlphabetically = _sortAlphabetically;
    final sortReverse = _sortReverse;

    // Split input text into lines and remove duplicates
    final lines = inputText
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
    final uniqueLines = lines.toSet().toList();

    // Sort lines if the corresponding options are selected
    if (sortAlphabetically) {
      uniqueLines.sort();
    }
    if (sortReverse) {
      uniqueLines.sort((a, b) => b.compareTo(a));
    }

    // Join the lines back into a single string with HTML formatting
    final outputText = uniqueLines.join('\n');
    _outputController.text = outputText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Content Processor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Paste your HTML content here...',
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _sortAlphabetically,
                  onChanged: (bool? value) {
                    setState(() {
                      _sortAlphabetically = value ?? false;
                    });
                  },
                ),
                Text('Sort alphabetically'),
                SizedBox(width: 20),
                Checkbox(
                  value: _sortReverse,
                  onChanged: (bool? value) {
                    setState(() {
                      _sortReverse = value ?? false;
                    });
                  },
                ),
                Text('Sort in reverse order'),
              ],
            ),
            ElevatedButton(
              onPressed: _processText,
              child: Text('Process Text'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: _outputController.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
