import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(BulkUrlOpenerApp());
}

class BulkUrlOpenerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulk URL Opener',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BulkUrlOpenerScreen(),
    );
  }
}

class BulkUrlOpenerScreen extends StatefulWidget {
  @override
  _BulkUrlOpenerScreenState createState() => _BulkUrlOpenerScreenState();
}

class _BulkUrlOpenerScreenState extends State<BulkUrlOpenerScreen> {
  TextEditingController _urlController = TextEditingController();

  void _openUrls() {
    final urls = _urlController.text.split(RegExp(r'[\n,]+')).map((url) => url.trim()).where((url) => url.isNotEmpty);

    for (var url in urls) {
      _launchUrl(url);
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'http://$url';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulk URL Opener'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _urlController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter URLs (separated by new lines or commas)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openUrls,
              child: Text('Open URLs'),
            ),
          ],
        ),
      ),
    );
  }
}
