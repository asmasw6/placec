import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/components/image_input.dart';
import 'package:places/components/location_input.dart';
import 'package:places/models/place.dart';
import 'package:places/providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final titleControler = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  _savePlace() {
    final enterTitle = titleControler.text;
    if (enterTitle.isEmpty || _selectedImage == null || _selectedLocation == null ) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlac(enterTitle, _selectedImage! , _selectedLocation!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    titleControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title:',
              ),
              controller: titleControler,
            ),
            const SizedBox(
              height: 10,
            ),
            // Image Input
            ImageInput(
              onSelectImage: (File image) {
                setState(() {
                  _selectedImage = image;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Location Input
            LocationInput( onSelectLocation: (PlaceLocation loc) {
                setState(() {
                  _selectedLocation = loc;
                });
              },),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
