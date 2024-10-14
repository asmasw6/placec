import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onSelectImage,
  });
  final void Function(File image) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectImage;

  Future<void> _takePicture() async {
    // Request necessary permissions
    var cameraStatus = await Permission.camera.request();
    // var storageStatus = await Permission.photos.request();
    // && storageStatus.isGranted

    if (cameraStatus.isGranted) {
      final imagePicker = ImagePicker();
      final XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );

      if (pickedImage == null) {
        return;
      }

      setState(() {
        _selectImage = File(pickedImage.path);
      });
      widget.onSelectImage(_selectImage!);
    } else {
      print('Permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text("Take Picture"),
      icon: const Icon(Icons.camera),
    );
    if (_selectImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .primary
              .withAlpha((255 * .2).toInt()),
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}
