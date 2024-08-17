import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'bulk_sms_sender_page.dart'; // Adjust the import path to where your BulkSmsSenderPage is located

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulk SMS Sender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BulkSmsSenderPage(),
    );
  }
}

class BulkSmsSenderPage extends StatefulWidget {
  @override
  _BulkSmsSenderPageState createState() => _BulkSmsSenderPageState();
}

class _BulkSmsSenderPageState extends State<BulkSmsSenderPage> {
  final TextEditingController _numbersController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendMessages() {
    final numbers =
        _numbersController.text.split(',').map((e) => e.trim()).toList();
    final message = _messageController.text;
    sendBulkSMS(numbers, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bulk SMS Sender')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numbersController,
              decoration:
                  InputDecoration(labelText: 'Phone Numbers (comma separated)'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendMessages,
              child: Text('Send Messages'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendBulkSMS(List<String> phoneNumbers, String message) async {
    final scriptPath = path.join(
      Directory.current.path,
      'lib',
      'tool',
      'scripts',
      'send_bulk_sms.ps1',
    );
    for (String phoneNumber in phoneNumbers) {
      await Process.run(
        'powershell.exe',
        [
          '-File',
          scriptPath,
          // 'lib/tool/scripts/send_bulk_sms.ps1',
          '-phoneNumber',
          phoneNumber,
          '-message',
          message
        ],
      );
    }
  }
}
