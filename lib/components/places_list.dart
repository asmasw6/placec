import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'package:places/screens/places_details.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places,
  });
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? const Center(child: Text("No places added yet ❗"))
        : ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundImage: FileImage(places[index].image),
                ),
                title: Text(
                  places[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  places[index].location.address,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlacesDetailsScreen(
                      place: places[index],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
