import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(DocumentAIApp());
}

class DocumentAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DocumentAIScreen(),
    );
  }
}

class DocumentAIScreen extends StatefulWidget {
  @override
  _DocumentAIScreenState createState() => _DocumentAIScreenState();
}

class _DocumentAIScreenState extends State<DocumentAIScreen> {
  String _documentText = 'Contai College of Learning & Management Science';
  final String _apiKey =
      'AIzaSyCX2opFoN4odOnwxXb3GtGZcrYbltpHvts'; // Replace with your API key
  final String _projectId = 'sdfds5655f5sd'; // Replace with your Project ID
  final String _location = 'in'; // Replace with your desired location

  Future<void> _processDocument(File file) async {
    final bytes = await file.readAsBytes();
    final base64File = base64Encode(bytes);

    final url = Uri.parse(
      'https://documentai.googleapis.com/v1/projects/$_projectId/locations/$_location/processDocument?key=$_apiKey',
    );

    final requestPayload = jsonEncode({
      "document": {
        "content": base64File,
        "mimeType": "application/pdf",
      },
      "features": [
        {"type": "DOCUMENT_TEXT_DETECTION"}
      ]
    });

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: requestPayload,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _documentText = jsonResponse['document']['text'];
      });
    } else {
      setState(() {
        _documentText = 'Error: ${response.statusCode}';
      });
    }
  }

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      await _processDocument(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Document AI Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickDocument,
              child: Text('Pick and Process PDF Document'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _documentText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
