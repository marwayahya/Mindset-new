
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// class TextEditorPage extends StatelessWidget {
//   final QuillController _controller = QuillController.basic();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Editor'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: () {
//               // Handle the saving of the text here
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: QuillEditor(
//                 controller: _controller,
//                 readOnly: false,
//                 autoFocus: true,
//                 expands: true,
//               ),
//             ),
//             // Add formatting options here
//           ],
//         ),
//       ),
//     );
//   }
// }
