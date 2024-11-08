class Reservation {
  final String id;
  final String roomId;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
  final List<String> participants;
  final Room? room;

  Reservation({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.participants,
    this.room,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      roomId: json['room_id'],
      userId: json['user_id'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      status: json['status'],
      participants: List<String>.from(json['participants']),
      room: json['room'] != null ? Room.fromJson(json['room']) : null,
    );
  }
}
