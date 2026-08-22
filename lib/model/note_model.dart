class NoteModel {
  final String id;
  final String title;
  final String containt;
  final String date;
  final String time;

  NoteModel({
    required this.id,
    required this.title,
    required this.containt,
    required this.date,
    required this.time,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      containt: json['containt'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'containt': containt,
      'date': date,
      'time': time,
    };
  }
}
