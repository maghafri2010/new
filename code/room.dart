class Room {
  final String id;
  final String name;
  final int capacity;
  final String location;
  final List<String> amenities;
  final String imageUrl;
  final bool isAvailable;

  Room({
    required this.id,
    required this.name,
    required this.capacity,
    required this.location,
    required this.amenities,
    required this.imageUrl,
    this.isAvailable = true,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      capacity: json['capacity'],
      location: json['location'],
      amenities: List<String>.from(json['amenities']),
      imageUrl: json['image_url'],
      isAvailable: json['is_available'] ?? true,
    );
  }
}
