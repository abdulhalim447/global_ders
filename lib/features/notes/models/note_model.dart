/// Model class for Note
class NoteModel {
  final String id;
  final String pdfName;
  final String fileName;
  final String filePath;
  final String uploadedAt;

  NoteModel({
    required this.id,
    required this.pdfName,
    required this.fileName,
    required this.filePath,
    required this.uploadedAt,
  });

  /// Factory constructor to create NoteModel from JSON
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] ?? '',
      pdfName: json['pdf_name'] ?? '',
      fileName: json['file_name'] ?? '',
      filePath: json['file_path'] ?? '',
      uploadedAt: json['uploaded_at'] ?? '',
    );
  }

  /// Convert NoteModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pdf_name': pdfName,
      'file_name': fileName,
      'file_path': filePath,
      'uploaded_at': uploadedAt,
    };
  }

  /// Get display name (pdf_name if available, otherwise fileName)
  String get displayName {
    if (pdfName.isNotEmpty) {
      return pdfName;
    }
    return fileName;
  }

  /// Get full PDF URL
  String get fullPdfUrl {
    // If filePath already contains full URL, return it
    if (filePath.startsWith('http')) {
      return filePath;
    }
    // Otherwise, construct the full URL
    return 'https://app.global-ders.com/global_ders/$filePath';
  }
}

/// Model class for Notes API Response
class NotesResponse {
  final bool error;
  final List<NoteModel> notes;
  final String? message;

  NotesResponse({required this.error, required this.notes, this.message});

  /// Factory constructor to create NotesResponse from JSON
  factory NotesResponse.fromJson(Map<String, dynamic> json) {
    return NotesResponse(
      error: json['error'] ?? false,
      notes:
          (json['notes'] as List<dynamic>?)
              ?.map((noteJson) => NoteModel.fromJson(noteJson))
              .toList() ??
          [],
      message: json['message'],
    );
  }

  /// Convert NotesResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'notes': notes.map((note) => note.toJson()).toList(),
      if (message != null) 'message': message,
    };
  }
}
