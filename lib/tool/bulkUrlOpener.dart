import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BulkUrlOpenerScreen extends StatefulWidget {
  String title;
  BulkUrlOpenerScreen(this.title);

  @override
  _BulkUrlOpenerScreenState createState() => _BulkUrlOpenerScreenState();
}

class _BulkUrlOpenerScreenState extends State<BulkUrlOpenerScreen> {
  TextEditingController _urlController = TextEditingController();

  void _openUrls() {
    final urls = _urlController.text
        .split(RegExp(r'[\n,]+'))
        .map((url) => url.trim())
        .where((url) => url.isNotEmpty);

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            BackButtonWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            textFormieldBar(context, _urlController,
                hinttext: "Separate with comma or one URL per line"),
            SizedBox(height: 16),
            Container(
              // color: Colors.white,
              width: MediaQuery.sizeOf(context).width - 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        _openUrls();
                        // final text = _controller.text;
                        // _controller.text = text.toUpperCase();
                      },
                      child: Text(
                        'Open URLs All',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        _urlController.text = '';
                        setState(() {});
                        // final text = _controller.text;
                        // _controller.text = text.toUpperCase();
                      },
                      child: Text(
                        'Clear',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //  Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: <Widget>[
      //       TextField(
      //         controller: _urlController,
      //         maxLines: 10,
      //         decoration: InputDecoration(
      //           border: OutlineInputBorder(),
      //           labelText: 'Enter URLs (separated by new lines or commas)',
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: _openUrls,
      //         child: Text('Open URLs'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
