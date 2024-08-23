import 'package:clipboard/clipboard.dart';

import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/tool/bulkImageConverter.dart';
import 'package:employee_management/tool/bulkUrlOpener.dart';
import 'package:employee_management/tool/function.dart';
import 'package:employee_management/tool/htmltotextandtexttohtml.dart';
import 'package:employee_management/tool/removeRemoveDuplicateLines.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

Widget textFormieldBar(BuildContext context, TextEditingController controller,
    {hinttext = "Paste your text",
    line = 5,
    Widget? suffixIcon,
    void Function(String)? onChanged}) {
  return Card(
    elevation: ColorPage.elevation,
    child: Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.sizeOf(context).width - 300,
      // decoration: BoxDecoration(boxShadow: ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        maxLines: line,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
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
            hintText: hinttext,
            labelStyle: TextStyle()),
      ),
    ),
  );
}

ButtonStyle buttonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
    textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
    shape: MaterialStatePropertyAll(
        ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0))),
    backgroundColor: MaterialStatePropertyAll(ColorPage.red));

class _ToolsState extends State<Tools> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    BulkUrlOpenerScreen('Bulk URL Opener'),
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
    RemoveDuplicateLines('Remove Duplicate Lines'),
    ImageConverterPage('Bulk Image Converter'),
    HtmlProcessorPage('HTML To Text')
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
          // selectedItemColor: Color.fromARGB(255, 7, 22, 45),
          // unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: ColorPage.buttoncolor1,
              icon: Icon(Icons.open_in_browser),
              label: 'Bulk URL Opener',
            ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.remove),
              label: 'Remove Duplicate Lines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image Converter',
            ),
            BottomNavigationBarItem(
              backgroundColor: ColorPage.buttoncolor1,
              icon: Icon(Icons.open_in_browser),
              label: 'Text To HTML',
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
            BackButtonWidget(),
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
                  ButtonWidget('Uppercase', () {
                    final text = _controller.text;
                    _controller.text = text.toUpperCase();
                  }),
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
                        final capitalizedText = text
                            .split(' ')
                            .map((word) => word.isNotEmpty
                                ? word[0].toUpperCase() +
                                    word.substring(1).toLowerCase()
                                : '')
                            .join(' ');
                        _controller.text = capitalizedText;
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
                        final titleCasedText = text
                            .split(' ')
                            .map((word) => word.isNotEmpty
                                ? word[0].toUpperCase() +
                                    word.substring(1).toLowerCase()
                                : '')
                            .join(' ');
                        _controller.text = titleCasedText;
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
            BackButtonWidget(),
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
                        _controller.text = text.replaceAll(',', '\n');
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
            BackButtonWidget(),
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
    print(text);
    final urls = text.split('\n').where((url) => url.isNotEmpty);
    final domains = <String>{};

    for (var url in urls) {
      // Ensure the URL has a scheme (http:// or https://)
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://' + url; // Prepend http:// if no scheme is provided
      }

      final uri = Uri.tryParse(url);
      print(uri);

      if (uri != null && uri.host.isNotEmpty) {
        domains.add(uri.host);
      }
    }

    print(domains);
    setState(() {
      _controller.text = domains.join('\n');
    });
  }

  void removeDuplicates(controller) {
    final uniqueDomains = _controller.text.split('\n').toSet();
    setState(() {
      _controller.text = uniqueDomains.join('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            BackButtonWidget(),
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
                      removeDuplicates(_controller);
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
                      ToolFunction.copyToClipboard(context, _controller);
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

class SerpLengthCheckerScreen extends StatefulWidget {
  SerpLengthCheckerScreen(this.title);
  String title = "";

  @override
  State<SerpLengthCheckerScreen> createState() =>
      _SerpLengthCheckerScreenState();
}

class _SerpLengthCheckerScreenState extends State<SerpLengthCheckerScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  final String metaText = '''
The Google SERP snippet optimization tool is a completely unpaid/free online tool that lets webmasters draft precise web page title and meta descriptions. Why are page title and meta description optimization necessary? According to the Google guidelines, Google trims your page meta title and meta description if the meta description length and meta tags length exceed the recommended limits.

As per the Google webmaster guidelines, the meta title of a web page should not exceed the recommended 50-60 characters. In addition to that, the meta description of a web page should not exceed 120 to 160 characters. Thus, the aim is to keep it short, simple, and SEO friendly without exceeding the character limits.

''';

  int characterCount = 0;
  int characterCount1 = 0;
  double pixelWidth = 0.0;
  double pixelWidth1 = 0.0;
  final url = "http://www.example.com".obs;
  String truncatedTitle =
      'For Example: #1 Digital Marketing Company - Example.com';
  String truncatedDescription =
      'Write your meta description to tell the Google users that you are the best in your industry! Tip: Use';

  // Function to estimate pixel width based on text length
  double _estimatePixelWidth(String text) {
    // Assuming a base width of 7 pixels per character as an average estimate
    return text.length * 7.0;
  }

  void _updateHelperText() {
    setState(() {
      characterCount = _controller.text.length;
      pixelWidth = _estimatePixelWidth(_controller.text);

      // Truncate the title if it exceeds 60 characters
      if (characterCount > 60) {
        truncatedTitle = _controller.text.substring(0, 60) + '...';
      } else {
        truncatedTitle = _controller.text;
      }
    });
  }

  void _updateHelperText1() {
    setState(() {
      characterCount1 = _controller1.text.length;
      pixelWidth1 = _estimatePixelWidth(_controller1.text);

      // Truncate the description if it exceeds 160 characters
      if (characterCount1 > 160) {
        truncatedDescription = _controller1.text.substring(0, 160) + '...';
      } else {
        truncatedDescription = _controller1.text;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateHelperText);
    _controller1.addListener(_updateHelperText1);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateHelperText);
    _controller.dispose();
    _controller1.removeListener(_updateHelperText1);
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BackButtonWidget(),
              Container(
                // color: ColorPage.red,
                width: 750,
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: 100,
                      child: Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/app_icon/EmpIcon/googleimg.png',
                              width: 70,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              truncatedTitle,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorPage.buttoncolor1,
                                  fontWeight: FontWeight.bold),
                            ),
                            Obx(
                              () => SizedBox(
                                // width: 400,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  url.value,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 3, 70, 6),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                truncatedDescription,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 75, 73, 73),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // height: 40,
                  width: 700,
                  child: Card(
                    child: TextFormField(
                      maxLines: 1,
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Page Title',
                        // contentPadding: EdgeInsets.symmetric(
                        //     vertical: 8, horizontal: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 700,
                    child: Text(
                      'Characters: $characterCount and Pixels: ${pixelWidth.toStringAsFixed(0)}',
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       width: 500,
              //       child: Text(
              //         'Truncated Title: $truncatedTitle',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 700,
                  child: Card(
                    child: TextFormField(
                      controller: _controller2,
                      onChanged: (value) {
                        url.value = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Page URL',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 700,
                  child: Card(
                    child: TextFormField(
                      maxLines: 2,
                      controller: _controller1,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Meta Description',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 700,
                    child: Text(
                      'Characters: $characterCount1 and Pixels: ${pixelWidth1.toStringAsFixed(0)}',
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Meta Title & Description Length Checker',
                              style: TextStyle(
                                  color: ColorPage.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          metaText,
                          style: TextStyle(color: ColorPage.buttoncolor1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
        .replaceAll(RegExp(r'[^a-z0-9\s-_]+'),
            '') // Remove special characters but keep spaces
        .replaceAll(RegExp(r'[_\s]+'), '-'); // Replace spaces with dashes
  }

  void removeNumbers() {
    final noNumbers = _controller.text.replaceAll(RegExp(r'\d+'), '');
    generateSlug(noNumbers);
  }

  void separateWithUnderscore() {
    final underscored = _controller.text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-_]+'),
            '') // Remove special characters but keep spaces
        .replaceAll(RegExp(r'[-\s]+'), '_'); // Replace spaces with underscores
    _controller.text = underscored;
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
            BackButtonWidget(),
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

class ExtractUrlsScreen extends StatefulWidget {
  final String title;

  ExtractUrlsScreen(this.title);

  @override
  State<ExtractUrlsScreen> createState() => _ExtractUrlsScreenState();
}

class _ExtractUrlsScreenState extends State<ExtractUrlsScreen> {
  final TextEditingController _controller = TextEditingController();

  final urls = <String>[].obs;

  void extractUrls(String text) {
    // Regular expression to match URLs, with or without a scheme (http/https)
    final regex = RegExp(
      r'(https?:\/\/)?([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})(\/[^\s]*)?',
    );

    // Find all matches in the text
    final matches = regex.allMatches(text);

    // Process each match
    final extractedUrls = matches.map((match) {
      // Extract the scheme, domain, and path components
      final scheme = match.group(1);
      final domain = match.group(2);
      final path = match.group(3) ?? '';

      // If the scheme is missing, prepend 'http://'
      final url = scheme == null ? 'http://' + domain! + path : match.group(0);

      return url ?? '';
    }).toList();

    // Convert list of URLs to a single string, joined by newlines
    final urlsString = extractedUrls.join('\n');

    // Set the extracted URLs to the text controller, removing unwanted characters
    _controller.text = urlsString;

    // Optionally, you might want to clean any unwanted characters
    _controller.text = _controller.text.replaceAll(RegExp(r'[()]+'), '');

    setState(() {});
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
            BackButtonWidget(),
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
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
              // onChanged: extractUrls,
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

class ExtractEmailsScreen extends StatefulWidget {
  final String title;

  ExtractEmailsScreen(this.title);

  @override
  State<ExtractEmailsScreen> createState() => _ExtractEmailsScreenState();
}

class _ExtractEmailsScreenState extends State<ExtractEmailsScreen> {
  final TextEditingController _controller = TextEditingController();

  final emails = <String>[].obs;

  void extractEmails(String text) {
    // Regular expression to match email addresses
    final emailRegex =
        RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');

    // Find all matches in the text
    final matches = emailRegex.allMatches(text);

    // Process each match and convert to a list of email addresses
    final extractedEmails =
        matches.map((match) => match.group(0) ?? '').toList();

    // Join the emails into a single string, separated by newlines
    final emailsString = extractedEmails.join('\n');

    // Set the extracted emails to the text controller
    _controller.text = emailsString;

    // Optionally, you can remove any unwanted characters
    _controller.text = _controller.text.replaceAll(RegExp(r'\[\]'), '');

    setState(() {});
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
            BackButtonWidget(),
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
            BackButtonWidget(),
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
            BackButtonWidget(),
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
                      onPressed: () =>
                          ToolFunction.copyToClipboard(context, _controller),
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
