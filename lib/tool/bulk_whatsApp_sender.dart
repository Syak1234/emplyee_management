import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/employee/widget/dialogwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BulkWhatsappSender extends StatefulWidget {
  const BulkWhatsappSender({Key? key}) : super(key: key);

  @override
  _BulkWhatsappSenderState createState() => _BulkWhatsappSenderState();
}

class _BulkWhatsappSenderState extends State<BulkWhatsappSender> {
  List<String> attachments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 237, 243, 248),
      body: Center(
        child: Column(
          children: [
            _buildHeader(),
            Container(
              width: 1200, // Adjust the width as needed
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                //  /
                color: ColorPage.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // _buildTextField(
                      //   'From',
                      //   'your@gmail.com',
                      // ),
                      const SizedBox(height: 20),
                      _buildTextField(
                          '+911234567890',
                          'Add sender numbers separated with comma, new line or import .xls or .csv file',
                          Icons.file_open),
                      // const SizedBox(height: 20),
                      // _buildTextField('Subject', 'Type here...'),
                      const SizedBox(height: 20),
                      _buildBodyField(),
                      const SizedBox(height: 20),
                      _buildAttachmentsSection(),
                      const SizedBox(height: 20),
                      _buildFooterButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/app_icon/whatsapp.png',
                width: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bulk WhatsApp Sender',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, [IconData? icon]) {
    return TextField(
      maxLines: 2,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: () {
                  // Add recipient or other actions
                },
              )
            : null,
      ),
    );
  }

  Widget _buildBodyField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Message',
        hintText: 'Write your message here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildAttachmentsSection() {
    return Column(
      children: [
        ...attachments.map((attachment) => _buildAttachmentItem(attachment)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonWidget(
              radius: 4,
              'Attach files',
              () {
                _selectFiles();
              },
              color: ColorPage.smallbuttoncolor,
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.image),
            //   tooltip: 'Insert image',
            // ),
          ],
        )
        // ElevatedButton.icon(
        //   onPressed: _selectFiles,
        //   icon: Icon(Icons.attach_file),
        //   label: Text('Attach files'),
        //   style: ButtonStyle(
        //       backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        // ),
      ],
    );
  }

  Widget _buildAttachmentItem(String attachment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(child: Text(attachment)),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeAttachment(attachment),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWidget(
          'Discard',
          () {},
          radius: 4,
        ),
        // OutlinedButton(
        //   onPressed: () {
        //     // Broadcast email
        //   },
        //   child: Text('Discard'),
        // ),
        ButtonWidget(
          radius: 4,
          'Start',
          () {
            dialog(
              context,
              child: TextFormField(
                decoration: InputDecoration(
                    fillColor: ColorPage.white,
                    filled: true,
                    hintText: 'Set time in second',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              title: 'Set Timer',
              onPressed1: () {
                Get.back();
              },
              onPressed2: () => Get.back(),
            );
          },
          color: ColorPage.green,
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     // Send email
        //   },
        //   child: Text('Send email'),
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(Colors.orange),
        //   ),
        // ),
      ],
    );
  }

  void _selectFiles() async {
    // Here you would implement file selection logic, for now we'll add a mock file
    setState(() {
      attachments.add('MockFile${attachments.length + 1}.pdf');
    });
  }

  void _removeAttachment(String attachment) {
    setState(() {
      attachments.remove(attachment);
    });
  }
}
