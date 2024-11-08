import 'package:flutter/material.dart';
import 'package:meetspace/models/room.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback onBookNow;
  final VoidCallback onCheckAvailability;

  const RoomCard({
    Key? key,
    required this.room,
    required this.onBookNow,
    required this.onCheckAvailability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: room.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _buildAmenities(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onBookNow,
                        child: const Text('Book now'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCheckAvailability,
                        child: const Text('Check AV'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenities() {
    return Wrap(
      spacing: 8,
      children: room.amenities.map((amenity) {
        return Chip(
          label: Text(amenity),
          backgroundColor: Colors.grey[800],
        );
      }).toList(),
    );
  }
}
