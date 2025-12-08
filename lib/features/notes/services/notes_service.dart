import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note_model.dart';

/// Service class for Notes API operations
class NotesService {
  // API endpoint
  static const String _baseUrl =
      'https://app.global-ders.com/global_ders/get_notes_list.php';

  /// Fetch notes list from API
  /// Returns NotesResponse containing list of notes
  /// Throws Exception if the request fails
  Future<NotesResponse> getNotesList() async {
    try {
      final response = await http
          .get(
            Uri.parse(_baseUrl),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              throw Exception(
                'Connection timeout. Please check your internet connection.',
              );
            },
          );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return NotesResponse.fromJson(jsonData);
      } else {
        throw Exception(
          'Failed to load notes. Status code: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (_) {
      throw Exception('Invalid response format from server');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
