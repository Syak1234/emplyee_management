import 'package:employee_management/color/color.dart';
import 'package:employee_management/tool/bulkImageConverter.dart';
import 'package:employee_management/tool/bulkUrlOpener.dart';
import 'package:employee_management/tool/bulkimageresizer.dart';
import 'package:employee_management/tool/htmltotextandtexttohtml.dart';
import 'package:employee_management/tool/removeRemoveDuplicateLines.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Tool extends StatelessWidget {
  final List<Map<String, dynamic>> tools = [
    {
      'name': 'Bulk URL Opener',
      'icon': Icons.open_in_browser,
      'route': BulkUrlOpenerScreen('Bulk URL Opener'),
    },
    {
      'name': 'Convert Case',
      'icon': Icons.edit_outlined,
      'route': ConvertCaseScreen('Convert Case'),
    },
    {
      'name': 'Replace New Lines To Comma',
      'icon': Icons.format_shapes,
      'route': ReplaceNewLinesScreen('Replace New Lines To Comma'),
    },
    {
      'name': 'Word Counter',
      'icon': Icons.text_format_outlined,
      'route': WordCounterScreen('Word Counter'),
    },
    {
      'name': 'Extract Domain from URL',
      'icon': Icons.domain_verification,
      'route': ExtractDomainScreen('Extract Domain from URL'),
    },
    {
      'name': 'Serp Length Checker',
      'icon': Icons.rule_sharp,
      'route': SerpLengthCheckerScreen('Serp Length Checker'),
    },
    {
      'name': 'Slug Generator',
      'icon': Icons.short_text_outlined,
      'route': SlugGeneratorScreen('Slug Generator'),
    },
    {
      'name': 'Extract Urls',
      'icon': Icons.link_outlined,
      'route': ExtractUrlsScreen('Extract Urls'),
    },
    {
      'name': 'Extract Emails',
      'icon': Icons.email_outlined,
      'route': ExtractEmailsScreen('Extract Emails'),
    },
    {
      'name': 'Remove Extra Spaces',
      'icon': Icons.space_bar_outlined,
      'route': ReplaceSpacesScreen('Replace Extra Spaces'),
    },
    {
      'name': 'Remove Numbers From Text',
      'icon': Icons.numbers_outlined,
      'route': RemoveNumbersScreen('Remove Numbers From Text'),
    },
    {
      'name': 'Remove Duplicate Lines',
      'icon': Icons.copy_outlined,
      'route': RemoveDuplicateLines('Remove Duplicate Lines'),
    },
    {
      'name': 'Bulk Image Converter',
      'icon': Icons.image_outlined,
      'route': ImageConverterPage('Bulk Image Converter'),
    },
    {
      'name': 'Bulk Image Resizer',
      'icon': Icons.image_aspect_ratio,
      'route': BulkImageResizerScreen()
    },
    {
      'name': 'HTML To Text',
      'icon': Icons.html,
      'route': HtmlProcessorPage('HTML To Text')
    },
    // {'name': 'Bulk Image Converter', 'icon': Icons.image_outlined},
  ];
  final List<Widget> routeWidgets = [];

  Tool() {
    for (var tool in tools) {
      routeWidgets.add(tool['route']);
    }
  }
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Empowering 150+ Free Online Tools',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      //   ),
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      // ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => Column(
              children: [
                Container(
                  color: ColorPage.red,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'With over 15 powerful tools, NexaCRM empowers millions of developers, SEOs, content writers, designers, sales teams, academic writers, and other professionals every month.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Type to search.',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.search, color: ColorPage.red),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: tools.length,
                    itemBuilder: (context, index) {
                      return ToolCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => routeWidgets[index],
                            ),
                          );
                          // Get.to(() => );
                        },
                        name: tools[index]['name']!,
                        widget: Icon(
                          tools[index]['icon']!,
                          size: 30,
                          color: ColorPage.red,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Dummy color page for example

class ToolCard extends StatelessWidget {
  final String name;
  final Widget widget; // Single parameter for either Icon or Image
  final void Function()? onTap;

  ToolCard({required this.name, required this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: ColorPage.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: widget), // Render the passed widget (Icon or Image)
              SizedBox(height: 16),
              Flexible(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? 16
                        : 14, // Responsive font size
                    fontWeight: FontWeight.w600,
                    color: ColorPage.buttoncolor1,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
