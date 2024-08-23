import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/employee/widget/searchWidget.dart';
import 'package:employee_management/employee/widget/textFormFieldWidget.dart';
import 'package:employee_management/tool/function.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HtmlProcessorPage extends StatefulWidget {
  String title;
  HtmlProcessorPage(this.title);

  @override
  _HtmlProcessorPageState createState() => _HtmlProcessorPageState();
}

class _HtmlProcessorPageState extends State<HtmlProcessorPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  bool _sortAlphabetically = false;
  bool _sortReverse = false;

  void _processText() {
    setState(() {});
    // final inputText = _inputController.text;
    // final sortAlphabetically = _sortAlphabetically;
    // final sortReverse = _sortReverse;

    // Split input text into lines and remove duplicates
    // final lines = inputText
    //     .split('\n')
    //     .map((line) => line.trim())
    //     .where((line) => line.isNotEmpty)
    //     .toList();
    // final uniqueLines = lines.toSet().toList();

    // Sort lines if the corresponding options are selected

    // Join the lines back into a single string with HTML formatting
    // final outputText = uniqueLines.join('\n');
    // _outputController.text = outputText;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BackButtonWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              textFormieldBar(
                context,
                _inputController,
                line: 16,
                hinttext: 'Paste your HTML content here...',
                onChanged: (p0) {
                  setState(() {
                    p0;
                  });
                },
              ),
              // buildTextFormField(
              //   controller: _inputController,
              //   hintText: 'Paste your HTML content here...',
              //   validator: (p0) {},

              // ),
              // TextField(
              //   controller: _inputController,
              //   maxLines: 10,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Paste your HTML content here...',
              //   ),
              // ),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: _sortAlphabetically,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _sortAlphabetically = value ?? false;
              //         });
              //       },
              //     ),
              //     Text('Sort alphabetically'),
              //     SizedBox(width: 20),
              //     Checkbox(
              //       value: _sortReverse,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _sortReverse = value ?? false;
              //         });
              //       },
              //     ),
              //     Text('Sort in reverse order'),
              //   ],
              // ),

              SizedBox(
                width: MediaQuery.sizeOf(context).width - 300,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ButtonWidget(
                        'Process Text',
                        () {
                          _processText();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: _processText,
              //   child: Text('Process Text'),
              // ),
              if (_inputController.text.isNotEmpty)
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: MediaQuery.sizeOf(context).width - 300,
                  // height: 700,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                ToolFunction.copyToClipboard(
                                    context, _outputController);
                              },
                              icon: Icon(Icons.copy_all)),
                        ],
                      ),
                      Html(
                        onLinkTap: (url, attributes, element) {
                          print(url);
                          launchUrlString(url.toString());
                        },

                        // shrinkWrap: true,
                        data: _inputController.text,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
