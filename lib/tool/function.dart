import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToolFunction {
  static void copyToClipboard(context, TextEditingController _controller) {
    print(_controller.text);
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }
}
