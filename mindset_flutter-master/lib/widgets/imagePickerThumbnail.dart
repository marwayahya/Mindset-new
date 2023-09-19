import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:mindset_flutter/utils/app_colors.dart';

class ImagePickerThumbnail extends StatefulWidget {
  @override
  _ImagePickerThumbnailState createState() => _ImagePickerThumbnailState();
}

class _ImagePickerThumbnailState extends State<ImagePickerThumbnail> {
  File? _image;

  // Function to pick an image from the device gallery
  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (_image != null)
          Container(
            width: 100,
            height: 100,
            child: Image.file(_image!),
          ),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text("Profile picture"),
          style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor.withOpacity(.8),  // Background color
  ),
           
        ),
      ],
    );
  }
}

