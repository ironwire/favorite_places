import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/new_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesState();
  }
}

class _PlacesState extends ConsumerState {
  refresh() {
    setState(() {});
  }

  // void _addPlace(Place place) {
  //   ref.read(placesNotifierProvider).add(place);
  // }

  @override
  Widget build(BuildContext context) {
    List<Place> places = ref.watch(placesNotifierProvider);
    print('mainContent goes here');
    print(places.length);
    //}

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Faorite Places'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const NewPlace()));
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlacesList(
              places: places,
            ),
          ) //mainContent,
              )
        ],
      ),
    );
  }
}
