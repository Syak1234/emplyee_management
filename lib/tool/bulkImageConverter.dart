import 'dart:io';
import 'dart:ui' as ui;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageConverterPage extends StatefulWidget {
  String title = "";
  ImageConverterPage(this.title);

  @override
  _ImageConverterPageState createState() => _ImageConverterPageState();
}

class _ImageConverterPageState extends State<ImageConverterPage> {
  List<File>? _imageFiles = [];
  String _selectedFormat = 'JPG';
  final ImagePicker _picker = ImagePicker();
  List<bool> _selectedImages = []; // List to keep track of selected images
  bool ischeckboxvalue = false;
  Future<void> _pickImages() async {
    // Request permissions
    await Permission.photos.request();
    if (await Permission.photos.isDenied) {
      return;
    }

    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _imageFiles = pickedFiles.map((file) => File(file.path)).toList();
        _selectedImages = List<bool>.filled(
            _imageFiles!.length, false); // Initialize selection list
      });
    } else {
      _imageFiles = null;
      setState(() {});
    }
    // pickedFiles = null;
  }

  Future<void> _convertImages(String format) async {
    if (_imageFiles == null) return;

    final directory = await getApplicationDocumentsDirectory();
    for (int i = 0; i < _imageFiles!.length; i++) {
      if (_selectedImages[i]) {
        // Only convert selected images
        final imageFile = _imageFiles![i];
        final image = img.decodeImage(imageFile.readAsBytesSync());

        if (image == null) continue;

        final fileName = imageFile.uri.pathSegments.last.split('.').first;
        final filePath = '${directory.path}/$fileName.$format';

        final convertedImage =
            format == 'png' ? img.encodePng(image) : img.encodeJpg(image);

        File(filePath).writeAsBytesSync(convertedImage!);

        // Notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved as $filePath')),
        );
      }
    }
  }

  BoxDecoration decoration = BoxDecoration(
    border:
        Border.all(width: 0.3, color: ui.Color.fromARGB(255, 172, 168, 168)),
  );
  final List<String> items = [
    'JPG',
    'PNG',
    'Webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                      backgroundColor: MaterialStatePropertyAll(ColorPage.red),
                      shape:
                          MaterialStatePropertyAll(ContinuousRectangleBorder()),
                    ),
                    onPressed: _pickImages,
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Choose Image File',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Convert To',
                    textScaler: TextScaler.linear(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        iconStyleData:
                            IconStyleData(iconEnabledColor: Colors.white),
                        // barrierColor: Colors.red,
                        dropdownStyleData: DropdownStyleData(
                          isOverButton: true,
                          decoration: BoxDecoration(
                            color: ColorPage.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: ColorPage.red,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: ColorPage.red, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                        ),
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ))
                            .toList(),
                        value: _selectedFormat,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedFormat = value.toString();
                          });
                        },

                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     style: ButtonStyle(
                  //       padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(ColorPage.red),
                  //       shape: MaterialStatePropertyAll(
                  //         ContinuousRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //           side: BorderSide.none,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () => _convertImages('png'),
                  //     child: Text(
                  //       'Convert PNG',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     style: ButtonStyle(
                  //       padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(ColorPage.red),
                  //       shape: MaterialStatePropertyAll(
                  //         ContinuousRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //           side: BorderSide.none,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () => _convertImages('jpg'),
                  //     child: Text(
                  //       'Convert JPG',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     style: ButtonStyle(
                  //       padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(ColorPage.red),
                  //       shape: MaterialStatePropertyAll(
                  //         ContinuousRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //           side: BorderSide.none,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () => _convertImages('webp'),
                  //     child: Text(
                  //       'Convert Webp',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            _imageFiles!.isEmpty
                ? Center(
                    child: Image.asset(
                    'assets/app_icon/nodatafound.png',
                    width: 400,
                  ))
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: decoration,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration:
                              decoration.copyWith(color: ColorPage.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(15)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorPage.buttoncolor1),
                                  shape: MaterialStatePropertyAll(
                                    ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide.none,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  ischeckboxvalue = !ischeckboxvalue;
                                  setState(() {
                                    _selectedImages = List<bool>.filled(
                                        _selectedImages.length,
                                        ischeckboxvalue);
                                  });
                                },
                                icon: Icon(
                                  ischeckboxvalue
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Select all',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              false
                                  ? ElevatedButton.icon(
                                      style: ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.all(15)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                ColorPage.buttoncolor1),
                                        shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      onPressed:
                                          () {}, // Change this to desired format
                                      icon: Icon(
                                        Icons.start,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'Start',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : ElevatedButton.icon(
                                      style: ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.all(15)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                ColorPage.buttoncolor1),
                                        shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      onPressed: () => _convertImages(
                                          'png'), // Change this to desired format
                                      icon: Icon(
                                        Icons.download,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'Save all',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _imageFiles!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Container(
                                margin: EdgeInsets.all(4),
                                decoration: decoration.copyWith(
                                    color: Colors.white,
                                    border: Border(
                                        left: BorderSide(
                                            width: 1,
                                            color: ui.Color.fromARGB(
                                                255, 207, 202, 202)),
                                        right: BorderSide(
                                            width: 1,
                                            color: ui.Color.fromARGB(
                                                255, 207, 202, 202)),
                                        top: BorderSide(
                                            width: 1,
                                            color: ui.Color.fromARGB(
                                                255, 207, 202, 202)),
                                        bottom: BorderSide(
                                            width: 3, color: Colors.green))),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(5),
                                  leading: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        activeColor: Colors.black,
                                        value: _selectedImages[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _selectedImages[index] = value!;
                                          });
                                        },
                                      ),
                                      Image.file(
                                        _imageFiles![index].absolute,
                                        fit: BoxFit.cover,
                                        width: 50,
                                      ),
                                    ],
                                  ),
                                  trailing: Container(
                                    child: true
                                        ? ElevatedButton(
                                            style: ButtonStyle(
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.all(15)),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      ColorPage
                                                          .smallbuttoncolor),
                                              shape: MaterialStatePropertyAll(
                                                ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  side: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                            onPressed: () => _convertImages(
                                                'png'), // Change this to desired format

                                            child: Text(
                                              'Save',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : IconButton(
                                            color: ColorPage.red,
                                            onPressed: () {
                                              setState(() {
                                                _imageFiles!.removeAt(index);
                                                _selectedImages.removeAt(index);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.close,
                                            ),
                                          ),
                                  ),
                                  title: Text(
                                    _imageFiles![index].path.split('/').last,
                                    style: TextStyle(
                                        color: ColorPage.buttoncolor1),
                                  ),
                                ),
                              ),
                            );
                          },
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
