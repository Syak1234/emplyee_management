import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/employee/widget/dialogwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PremiumDashBoard extends StatefulWidget {
  const PremiumDashBoard({super.key});

  @override
  State<PremiumDashBoard> createState() => _PremiumDashBoardState();
}

class PendingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Purchase'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Optional: hourglass icon to symbolize waiting
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PremiumDashBoardState extends State<PremiumDashBoard> {
  final List<Map<String, dynamic>> tools = [
    {'name': 'Canva Pro', 'Image': 'assets/app_icon/canva.jpeg', 'price': '99'},
    {
      'name': 'Turnitin',
      'Image': 'assets/app_icon/turnitin.jpeg',
      'price': '199'
    },
    {
      'name': 'Chat GPT Pro',
      'Image': 'assets/app_icon/chatgpt.jpeg',
      'price': '1199'
    },
    {
      'name': 'Screaming Frog',
      'Image': 'assets/app_icon/screamingfrog.jpeg',
      'price': '499'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   // height: 100,
              //   child: Column(
              //     children: [
              //       // CircularProgressIndicator(), // Loading indicator
              //       SizedBox(height: 20),
              //       Text(
              //         'Your purchase is pending...',
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(height: 10),
              //       Text(
              //         'Please wait while we process your request.',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(fontSize: 16),
              //       ),
              //       SizedBox(height: 30),
              //       Icon(
              //         Icons.hourglass_empty,
              //         size: 50,
              //         color: Colors.orange,
              //       ),
              //     ],
              //   ),
              // ),

              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/app_icon/canva.jpeg'),
                        width: 30,
                      ),
                      SizedBox(width: 10), // Add spacing between image and text
                      Expanded(
                        // Make the text wrap properly
                        child: Text(
                          'Your request to purchase Canva Pro has been received. A member of our team will be in touch with you shortly. Once the payment is processed, your tool will be activated within 24 hours.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true, // Allow text to wrap
                        ),
                      ),
                      SizedBox(
                          width: 10), // Add spacing between text and status
                      Text(
                        'Status: Pending',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Determine the number of columns based on the available width
                    int crossAxisCount = constraints.maxWidth > 800
                        ? 4
                        : constraints.maxWidth > 600
                            ? 3
                            : 2;

                    return GridView.builder(
                      // shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio:
                            1 / 1, // Aspect ratio of 1:1 for square cards
                      ),
                      itemCount: tools.length,
                      itemBuilder: (context, index) {
                        return ToolCard1(
                          name: tools[index]['name']!,
                          imagePath: tools[index]['Image']!,
                          // onTap: () {},
                          price: tools[index]['price'],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController namefield = TextEditingController();
TextEditingController emailfield = TextEditingController();
TextEditingController phnofield = TextEditingController();

class ToolCard1 extends StatelessWidget {
  final String name;
  final String imagePath;
  final void Function()? onTap;
  final String price;
  ToolCard1(
      {required this.name,
      required this.imagePath,
      this.onTap,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // margin: EdgeInsets.,
      borderOnForeground: false,
      // shape: Border.fromBorderSide(BorderSide.none),
      color: ColorPage.buttoncolor1,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // height: 150,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill, // Ensure image fits within the box
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorPage.white,
              fontSize: MediaQuery.of(context).size.width > 600
                  ? 16
                  : 14, // Responsive font size
              fontWeight: FontWeight.bold,
              // color: Colors.black, // Adjusted color
            ),
            overflow: TextOverflow.ellipsis, // Handle overflow
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' \u{20B9}$price', // Unicode for the rupee symbol
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ColorPage.white),
              ),
              ButtonWidget(
                radius: 6,
                'Buy now',
                () {
                  dialog(
                    context,
                    title: name,
                    buttonname2: 'Send Request',
                    buttonname1: 'Cancel',
                    child: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text('Enter your details'),
                          ],
                        ),
                        TextFormFieldWidget(
                          hint: 'Name',
                          controller: namefield,
                        ),
                        TextFormFieldWidget(
                          hint: 'Phone no',
                          controller: phnofield,
                        ),
                        TextFormFieldWidget(
                          hint: 'Email (Optional)',
                          controller: emailfield,
                        ),
                      ],
                    )),
                    onPressed1: () {
                      Get.back();
                    },
                    onPressed2: () {
                      Get.back();
                    },
                  );
                },
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  String hint;
  TextEditingController controller = TextEditingController();
  TextFormFieldWidget({this.hint = "Type Here", required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: ColorPage.white,
            filled: true,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
