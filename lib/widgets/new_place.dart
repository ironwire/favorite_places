import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key}); //, required this.onAddPlace});
  //final void Function(Place place) onAddPlace;
  //final Function() notifyParent;
  @override
  ConsumerState<NewPlace> createState() {
    return _NewPalceState();
  }
}

class _NewPalceState extends ConsumerState<NewPlace> {
  final _placeNameController = TextEditingController();
  File? _takenImage;
  PlaceLocation? _selectedLocation;

  void _submitPlaceData() {
    if (_placeNameController.text.isEmpty && _takenImage == null) {
      return;
    }
    Place newPlace = Place(
        name: _placeNameController.text,
        image: _takenImage!,
        location: _selectedLocation!);

    //List<Place> places =
    ref.read(placesNotifierProvider.notifier).addPlace(newPlace);

    //print(places.length);
    //widget.notifyParent;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _placeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _placeNameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: 'Place Name'),
            ),
            const SizedBox(height: 8),
            ImageInput(
              onSelectImage: (image) {
                _takenImage = image;
              },
            ),
            const SizedBox(height: 8),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _submitPlaceData,
              icon: const Icon(Icons.new_label_outlined),
              label: const Text('Add New Place'),
            )
          ],
        ),
      ),
    );
  }
}
