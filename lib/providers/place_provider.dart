import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addPlace(Place place) {
    state = [...state, place];
  }

  void togglePlace(Place place) {
    final placeIsFavorite = state.contains(place);

    if (placeIsFavorite) {
      state = state.where((p) => p.id != place.id).toList();
    } else {
      state = [...state, place];
    }
  }
}

final placesNotifierProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier();
});
