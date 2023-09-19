import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class MyQuillEditorPage extends StatefulWidget {
  @override
  _MyQuillEditorPageState createState() => _MyQuillEditorPageState();
}

class _MyQuillEditorPageState extends State<MyQuillEditorPage> {
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quill Editor Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: QuillEditor(
          controller: _controller,
          readOnly: false, // Set to true for read-only mode
          autoFocus: true,
          scrollController: ScrollController(), // Add a ScrollController
          focusNode: FocusNode(), // Add a FocusNode
          scrollable: true, 
          expands: true,
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
