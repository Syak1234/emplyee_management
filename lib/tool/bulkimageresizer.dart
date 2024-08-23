import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:flutter/material.dart';

class BulkImageResizerScreen extends StatelessWidget {
  const BulkImageResizerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulk Image Resizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             BackButtonWidget(),
            Row(
              children: [
                // Left side: Drag and Drop area
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image, size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text('Drag and Drop Image'),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle Browse action
                              },
                              child: const Text('Browse'),
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: () {
                                // Handle Import from URL action
                              },
                              child: const Text('Import from URL'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Right side: Custom Resize options
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Custom Resize',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            // Width input
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Width'),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      suffixText: 'px',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Height input
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Height'),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      suffixText: 'px',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            // X Scale input
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('X Scale'),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      suffixText: '%',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Y Scale input
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Y Scale'),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      suffixText: '%',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Lock Aspect Ratio checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: false, // Initially unchecked
                              onChanged: (bool? value) {
                                // Handle checkbox toggle
                              },
                            ),
                            const Text('Lock Aspect Ratio'),
                          ],
                        ),
                      ],
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

void main() => runApp(const MaterialApp(
      home: BulkImageResizerScreen(),
    ));
