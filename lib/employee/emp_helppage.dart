import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelpPage extends StatefulWidget {
  HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   alignment: Alignment.center,
                    //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    //   child: Text(
                    //     'Help',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 7, 22, 45),
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                      child: Text(
                        'Hi, how can we help you?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 22, 45),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                        child: Text.rich(
                          TextSpan(
                              text:
                                  'Use Knowledge Base search below or find answers in ',
                              children: [
                                TextSpan(
                                    text: 'Tutorials',
                                    style: TextStyle(
                                        color: ColorPage.red,
                                        fontWeight: FontWeight.w600))
                              ]),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchBarWidget(search: 'Describe your issue'),
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => HelpBox())
            ],
          ),
        ),
      ),
    );
  }
}

class HelpBox extends StatefulWidget {
  const HelpBox({super.key});

  @override
  State<HelpBox> createState() => _HelpBoxState();
}

class _HelpBoxState extends State<HelpBox> {
  bool _isHovered = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.3,
            ),
          ),
          child: Card(
            shape: ContinuousRectangleBorder(),
            color: _isHovered ? ColorPage.buttoncolor1 : ColorPage.white,
            surfaceTintColor:
                _isHovered ? ColorPage.buttoncolor1 : ColorPage.white,
            child: ExpansionTile(
              leading: Icon(
                Icons.circle,
                size: 10,
                color: _isHovered || _isExpanded
                    ? ColorPage.white
                    : ColorPage.buttoncolor1,
              ),
              collapsedIconColor: ColorPage.red,
              // childrenPadding:
              //     EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              expandedAlignment: Alignment.center,
              shape: Border.all(),
              backgroundColor: _isExpanded
                  ? ColorPage.buttoncolor1
                  : ColorPage.white, // Title background when expanded
              collapsedBackgroundColor:
                  _isHovered ? ColorPage.buttoncolor1 : ColorPage.white,
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  color: ColorPage.white, // Background color for children
                  child: Text(
                      'Borrowers Consultancy offers a comprehensive range of services to assist clients throughout their borrowing journey. Our Pre-Loan Services include personalized guidance and support to help clients secure the best loan options tailored to their financial needs. We specialize in NPA/OTS Funding, providing expert solutions and funding options for Non-Performing Assets (NPA) and One-Time Settlement (OTS) cases, ensuring clients can navigate these challenging situations effectively. Additionally, our Post NPA Services offer continued support and strategies to manage and resolve NPAs, helping clients regain financial stability and move forward confidently. For more detailed information on our services, please refer to our FAQ section.'),
                ),
              ],
              title: Text(
                'What kinds of services are provided by Nexa CRM?',
                style: TextStyle(
                  color: _isExpanded
                      ? ColorPage.white
                      : (_isHovered ? ColorPage.white : ColorPage.buttoncolor1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
