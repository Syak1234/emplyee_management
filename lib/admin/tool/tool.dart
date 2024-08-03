import 'package:clipboard/clipboard.dart';

import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

void main() {
  runApp(MyAppTool());
}

class MyAppTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Text Tools',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

Widget textFormieldBar(
  BuildContext context,
  TextEditingController controller,
) {
  return Card(
    elevation: ColorPage.elevation,
    child: Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.sizeOf(context).width - 300,
      // decoration: BoxDecoration(boxShadow: ),
      child: TextFormField(
        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
            fillColor: ColorPage.white,
            filled: true,
            // prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.zero),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.zero),
            hintText: 'Paste your text',
            labelStyle: TextStyle()),
      ),
    ),
  );
  ;
}

ButtonStyle buttonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
    textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
    shape: MaterialStatePropertyAll(
        ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0))),
    backgroundColor: MaterialStatePropertyAll(ColorPage.buttoncolor1));

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ConvertCaseScreen('Convert Case'),
    ReplaceNewLinesScreen('Replace New Lines To Comma'),
    WordCounterScreen('Word Counter'),
    ExtractDomainScreen('Extract Domain from URL'),
    SerpLengthCheckerScreen('Serp Length Checker'),
    SlugGeneratorScreen('Slug Generator'),
    ExtractUrlsScreen('Extract Urls'),
    ExtractEmailsScreen('Extract Emails'),
    ReplaceSpacesScreen('Replace Extra Spaces'),
    RemoveNumbersScreen('Remove Numbers From Text'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        // width: 500,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: BottomNavigationBar(
          // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          type: BottomNavigationBarType.fixed,

          // fixedColor: Colors.red,
          // backgroundColor: Colors.red,
          // selectedIconTheme: IconThemeData(opacity: 0),
          showUnselectedLabels: true,
          // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          // selectedItemColor: Colors.black,
          // unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: ColorPage.buttoncolor1,
              icon: Icon(Icons.text_fields),
              label: 'Convert Case',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Replace New Lines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered),
              label: 'Word Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.link),
              label: 'Extract Domain',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'SERP Length Checker',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alternate_email),
              label: 'Slug Generator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.link),
              label: 'Extract URLs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Extract Emails',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.space_bar),
              label: 'Replace Spaces',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_circle),
              label: 'Remove Numbers',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ConvertCaseScreen extends StatefulWidget {
  String title = "";
  ConvertCaseScreen(this.title);

  @override
  State<ConvertCaseScreen> createState() => _ConvertCaseScreenState();
}

class _ConvertCaseScreenState extends State<ConvertCaseScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            textFormieldBar(context, _controller),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.sizeOf(context).width - 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        final text = _controller.text;
                        _controller.text = text.toUpperCase();
                      },
                      child: Text(
                        'Uppercase',
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
                        final text = _controller.text;
                        _controller.text = text.toLowerCase();
                      },
                      child: Text(
                        'Lowercase',
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
                        final text = _controller.text;
                        _controller.text = text
                            .split(' ')
                            .map((word) => word.toUpperCase())
                            .join(' ');
                      },
                      child: Text(
                        'Capital Case',
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
                        final text = _controller.text;
                        _controller.text = text
                            .split(' ')
                            .map((word) => word.toUpperCase())
                            .join(' ');
                      },
                      child: Text(
                        'Title Case',
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
                        FlutterClipboard.copy(_controller.text);

                        setState(() {});
                      },
                      child: Text(
                        'Copy to clipboard',
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
                        _controller.text = "";
                        setState(() {});
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

extension StringExtension on String {
  String? get capitalize {
    if (this == null) {
      return null;
    }
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + this.substring(1);
  }
}

class ReplaceNewLinesScreen extends StatefulWidget {
  String title = "";
  ReplaceNewLinesScreen(this.title);

  @override
  State<ReplaceNewLinesScreen> createState() => _ReplaceNewLinesScreenState();
}

class _ReplaceNewLinesScreenState extends State<ReplaceNewLinesScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            textFormieldBar(context, _controller),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.sizeOf(context).width - 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        final text = _controller.text;
                        _controller.text = text.replaceAll('\n', ',');
                        setState(() {});
                        print(_controller.text);
                      },
                      child: Text(
                        'Replace New Lines with Commas',
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
                        final text = _controller.text;
                        _controller.text = text.replaceAll('\n', ',');
                        setState(() {});
                        print(_controller.text);
                      },
                      child: Text(
                        'Replace Comma with New Lines',
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
                        FlutterClipboard.copy(_controller.text);

                        setState(() {});
                      },
                      child: Text(
                        'Copy to clipboard',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConvertCaseController extends GetxController {
  var text = ''.obs;

  void toUpperCase() {
    text.value = text.value.toUpperCase();
  }

  void toLowerCase() {
    text.value = text.value.toLowerCase();
  }

  void toCapitalize() {
    text.value =
        text.value.split(' ').map((word) => word.toUpperCase()).join(' ');
  }
}

class WordCounterScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  String title = "";
  WordCounterScreen(this.title);
  final wordCount = 0.obs;
  final characterCount = 0.obs;
  Widget tooltextfotmfiled(TextEditingController controller, context) {
    void countWords(String text) {
      characterCount.value = text.length;
      wordCount.value =
          text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
    }

    return Card(
      elevation: ColorPage.elevation,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 300,
        child: TextField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
              fillColor: ColorPage.white,
              filled: true,
              // prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.zero),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.zero),
              hintText: 'Paste your text',
              labelStyle: TextStyle()),
          onChanged: (v) {
            countWords(
              v,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            tooltextfotmfiled(_controller, context),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 300,
              child: Row(
                children: [
                  Obx(() => Text(
                        'Word Count: ${wordCount.value}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  Obx(() => Text(
                        '      Character Count: ${characterCount.value}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExtractDomainScreen extends StatefulWidget {
  final String title;
  ExtractDomainScreen(this.title);

  @override
  State<ExtractDomainScreen> createState() => _ExtractDomainScreenState();
}

class _ExtractDomainScreenState extends State<ExtractDomainScreen> {
  final TextEditingController _controller = TextEditingController();
  // String _result = '';

  void extractDomain(String text) {
    final urls = text.split('\n').where((url) => url.isNotEmpty);
    final domains = <String>{};

    for (var url in urls) {
      final uri = Uri.tryParse(url);
      if (uri != null) {
        domains.add(uri.host);
      }
    }

    setState(() {
      _controller.text = domains.join('\n');
    });
  }

  void removeDuplicates() {
    final uniqueDomains = _controller.text.split('\n').toSet();
    setState(() {
      _controller.text = uniqueDomains.join('\n');
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter URLs. One per line.',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      extractDomain(_controller.text);
                    },
                    child: Text(
                      'Extract Domain',
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
                      removeDuplicates();
                    },
                    child: Text(
                      'Remove Duplicate',
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
                      copyToClipboard();
                    },
                    child: Text(
                      'Copy to Clipboard',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _controller.text,
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

class SerpLengthCheckerScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final isLengthValid = false.obs;

  SerpLengthCheckerScreen(this.title);
  String title = "";
  void checkLength(String text) {
    isLengthValid.value = text.length <= 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
              onChanged: checkLength,
            ),
            SizedBox(height: 16),
            Obx(() => Text(
                  isLengthValid.value
                      ? 'Within SERP Length'
                      : 'Exceeds SERP Length',
                  style: TextStyle(
                      color: isLengthValid.value ? Colors.green : Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}

class SlugGeneratorScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  // final slug = ''.obs;
  final String title;

  SlugGeneratorScreen(this.title);

  void generateSlug(String text) {
    _controller.text = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]+'),
            '') // Remove special characters but keep spaces
        .replaceAll(RegExp(r'\s+'), '-'); // Replace spaces with dashes
  }

  void removeNumbers() {
    final noNumbers = _controller.text.replaceAll(RegExp(r'\d+'), '');
    generateSlug(noNumbers);
  }

  void separateWithUnderscore() {
    final underscored = _controller.text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]+'),
            '') // Remove special characters but keep spaces
        .replaceAll(RegExp(r'\s+'), '_'); // Replace spaces with underscores
    _controller.text = underscored;
  }

  void copyToClipboard(context) {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void clearText() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text. One per line.',
                border: OutlineInputBorder(),
              ),
              // onChanged: generateSlug,
            ),
            SizedBox(height: 16),
            // Obx(() => Text(
            //       'Slug: ${_controller.text}',
            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //     )),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: removeNumbers,
                    child: Text(
                      'Remove Number',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: separateWithUnderscore,
                    child: Text(
                      'Separate with Underscore ( _ )',
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
                      generateSlug(_controller.text);
                    },
                    child: Text(
                      'Separate with Dash ( - )',
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
                      copyToClipboard(context);
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
                    onPressed: clearText,
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractUrlsScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final urls = <String>[].obs;
  final String title;

  ExtractUrlsScreen(this.title);

  void extractUrls(String text) {
    urls.value = RegExp(r'http[s]?:\/\/[^ \n]+')
        .allMatches(text)
        .map((match) => match.group(0) ?? '')
        .toList();
  }

  void copyToClipboard(context) {
    final allUrls = urls.join('\n');
    Clipboard.setData(ClipboardData(text: allUrls));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void clear() {
    _controller.clear();
    urls.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
              onChanged: extractUrls,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      extractUrls(_controller.text);
                    },
                    child: Text(
                      'Extract URLs & Links',
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
                      copyToClipboard(context);
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
                    onPressed: clear,
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 16),
            // Obx(() => Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: urls.map((url) => Text(url)).toList(),
            //     )),
          ],
        ),
      ),
    );
  }
}

class ExtractEmailsScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final emails = <String>[].obs;
  final String title;

  ExtractEmailsScreen(this.title);

  void extractEmails(String text) {
    emails.value = RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
        .allMatches(text)
        .map((match) => match.group(0) ?? '')
        .toList();
  }

  void copyToClipboard(context) {
    final allEmails = emails.join('\n');
    Clipboard.setData(ClipboardData(text: allEmails));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void clear() {
    _controller.clear();
    emails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
              // onChanged: extractEmails,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      extractEmails(_controller.text);
                    },
                    child: Text(
                      'Extract Emails',
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
                      copyToClipboard(context);
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
                    onPressed: clear,
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Obx(() => Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: emails.map((email) => Text(email)).toList(),
            //     )),
          ],
        ),
      ),
    );
  }
}

class ReplaceSpacesScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String title;

  ReplaceSpacesScreen(this.title);

  void replaceSpaces() {
    _controller.text = _controller.text.replaceAll(RegExp(r'\s+'), ' ');
  }

  void copyToClipboard(context) {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void clear() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: replaceSpaces,
                    child: Text(
                      'Remove Extra Spaces',
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
                      copyToClipboard(context);
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
                    onPressed: clear,
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RemoveNumbersScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String title;

  RemoveNumbersScreen(this.title);

  void removeNumbers() {
    _controller.text = _controller.text.replaceAll(RegExp(r'[0-9]'), '');
  }

  void copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void clear() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            textFormieldBar(context, _controller),
            // TextField(
            //   controller: _controller,
            //   maxLines: 5,
            //   decoration: InputDecoration(
            //     hintText: 'Enter text here',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: removeNumbers,
                      child: Text(
                        'Remove Numbers',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () => copyToClipboard(context),
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
                      onPressed: clear,
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
