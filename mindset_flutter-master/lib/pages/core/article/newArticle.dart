// text_editor_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class TextEditorScreen extends StatefulWidget {
  @override
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Text Editor'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Handle saving the text here
              final plainText = _controller.document.toPlainText();
              print('Text saved: $plainText');
              Navigator.pop(context); // Close the text editor screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: QuillEditor(
                controller: _controller,
                readOnly: false,
                autoFocus: true,
                expands: true,
                padding: EdgeInsets.all(8),
                scrollController: ScrollController(), // Add a ScrollController
  focusNode: FocusNode(), // Add a FocusNode
  scrollable: true, // Add the scrollable parameter
                //color: Colors.white,
              ),
            ),
            QuillToolbar.basic(
              controller: _controller,
              showBoldButton: true,
              showItalicButton: true,
              showUnderLineButton: true,
              showListNumbers: true,
              showListBullets: true,
            ),
          ],
        ),
      ),
    );
  }
}
