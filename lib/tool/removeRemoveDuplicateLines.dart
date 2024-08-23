import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:employee_management/tool/function.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:flutter/material.dart';

class RemoveDuplicateLines extends StatefulWidget {
  String title = "";
  RemoveDuplicateLines(this.title, {super.key});

  @override
  State<RemoveDuplicateLines> createState() => _RemoveDuplicateLinesState();
}

class _RemoveDuplicateLinesState extends State<RemoveDuplicateLines> {
  TextEditingController _controller = TextEditingController();
  // void removeDuplicates() {
  //   // Split the text into lines
  //   final lines = _controller.text.split('\n');

  //   // Create a Set to store unique lines
  //   Set<String> uniqueLines = {};

  //   // Process each line to remove duplicate words and lines
  //   final processedLines = lines.map((line) {
  //     // Remove duplicate words within the line
  //     final words = line.split(' ').toSet().toList();
  //     // Join words back into a line
  //     final uniqueLine = words.join(' ');
  //     return uniqueLine;
  //   }).toList();

  //   // Remove duplicate lines
  //   processedLines.forEach((line) {
  //     uniqueLines.add(line.trim());
  //   });

  //   // Join the unique lines back into a single string
  //   _controller.text = uniqueLines.join('\n');
  //   setState(() {});
  // }

  void removeDuplicates(controller) {
    final uniqueDomains = controller.text.split('\n').toSet();
    setState(() {
      _controller.text = uniqueDomains.join('\n');
    });
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
            textFormieldBar(context, _controller,
                hinttext: "Paste Text Lines in this Box"),
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
                        removeDuplicates(_controller);
                        // _openUrls();
                        // final text = _controller.text;
                        // _controller.text = text.toUpperCase();
                      },
                      child: Text(
                        'Remove Duplicate Lines',
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
                        ToolFunction.copyToClipboard(context, _controller);
                      },
                      child: Text(
                        'Copy to Clipboard',
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
                        _controller.text = '';
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
    );
  }
}
