import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:flutter/material.dart';

class BulkMailSender extends StatefulWidget {
  const BulkMailSender({super.key});

  @override
  _BulkMailSenderState createState() => _BulkMailSenderState();
}

class _BulkMailSenderState extends State<BulkMailSender> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _attachmentsController = TextEditingController();

  final List<String> _failedEmails = [
    // 'ab@gmail.com',
    // 'ab@gmail.com',
    // 'ab@gmail.com',
    // 'ab@gmail.com'
  ]; // List to hold failed emails

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _attachmentsController.dispose();
    super.dispose();
  }

  void _sendEmail() {
    // Simulate email sending
    // If failed, add to _failedEmails
    // Example:
    // if (emailFailed) {
    //   setState(() {
    //     _failedEmails.add(failedEmailAddress);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/app_icon/gmail.png',
                    width: 65,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Bulk Email Sender',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'From',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            textFormieldBar(
              context,
              _fromController,
              hinttext: 'abc@gmail.com',
              line: 1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'To',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            textFormieldBar(
              context,
              _toController,
              hinttext:
                  'Enter emails separated by commas or import an Excel file',
              line: 5,
              suffixIcon: IconButton(
                onPressed: () {
                  // Add your file import logic here
                },
                icon: const Icon(Icons.file_upload),
              ),
            ),
            textFormieldBar(
              context,
              _attachmentsController,
              hinttext: 'Attachments',
              line: 2,
              suffixIcon: IconButton(
                onPressed: () {
                  // Add your file open logic here
                },
                icon: const Icon(Icons.file_open),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 300,
              child: Row(
                children: [
                  ButtonWidget('Submit', () {
                    _sendEmail(); // Call your email sending logic here
                  }),
                  const SizedBox(width: 10),
                  ButtonWidget('Clear', () {
                    setState(() {
                      _fromController.clear();
                      _toController.clear();
                      _attachmentsController.clear();
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _failedEmails.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Failed Emails:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _failedEmails.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_failedEmails[index]),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _failedEmails.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width - 300,
              child: RichText(
                text: TextSpan(
                  text: 'Note: ',
                  style: TextStyle(
                    color: ColorPage.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'This tool sends an email every 10 seconds to ensure timely and efficient communication. If any email fails to send, the system will immediately flag it and display it prominently in a button list. This allows for quick identification and resolution, ensuring no message is left unsent. Efficient, reliable, and user-friendly—this system keeps your communication on track.',
                      style: TextStyle(
                        color: ColorPage.red,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
