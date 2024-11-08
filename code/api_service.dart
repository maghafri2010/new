import 'package:dio/dio.dart';
import 'package:meetspace/models/room.dart';
import 'package:meetspace/models/reservation.dart';
import 'package:meetspace/models/user.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.meetspace.com/v1',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  static void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Auth endpoints
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  static Future<Map<String, dynamic>> signup(
    String username,
    String email,
    String password,
  ) async {
    final response = await _dio.post('/auth/signup', data: {
      'username': username,
      'email': email,
      'password': password,
    });
    return response.data;
  }

  // Room endpoints
  static Future<List<Room>> getAvailableRooms(DateTime date) async {
    final response = await _dio.get('/rooms/available', queryParameters: {
      'date': date.toIso8601String(),
    });
    return (response.data['rooms'] as List)
        .map((room) => Room.fromJson(room))
        .toList();
  }

  // Reservation endpoints
  static Future<List<Reservation>> getUserReservations() async {
    final response = await _dio.get('/reservations');
    return (response.data['reservations'] as List)
        .map((reservation) => Reservation.fromJson(reservation))
        .toList();
  }

  static Future<Reservation> createReservation({
    required String roomId,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final response = await _dio.post('/reservations', data: {
      'room_id': roomId,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
    });
    return Reservation.fromJson(response.data['reservation']);
  }
}
