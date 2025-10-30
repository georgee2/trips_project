import 'package:intl/intl.dart';

class ItemModel {
  final String id;
  final String status;
  final String title;
  final String coverImg;
  final String tasks;
  final String date;
  final List<Participant> participants;

  ItemModel({
    required this.id,
    required this.status,
    required this.title,
    required this.coverImg,
    required this.tasks,
    required this.date,
    required this.participants,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      title: json['title'] ?? '',
      coverImg: json['cover_image'] ?? '',
      tasks: json['unfinished_tasks']?.toString() ?? '0',
      date: formatDates(json['dates']['start'], json['start']['end']),
      participants: (json['participants'] as List<dynamic>? ?? []).map((e) => Participant.fromJson(e)).toList(),
    );
  }

  static String formatDates(String start, String end) {
    try {
      final DateFormat inputFormat = DateFormat('dd-MM-yyyy');
      final DateFormat outputFormat = DateFormat('MMM d, yyyy');

      final startDate = inputFormat.parse(start);
      final endDate = inputFormat.parse(end);

      final nights = endDate.difference(startDate).inDays;
      final startStr = DateFormat('MMM d').format(startDate);
      final endStr = outputFormat.format(endDate);

      return '$nights Nights ($startStr - $endStr)';
    } catch (e) {
      return '';
    }
  }
}

class Participant {
  final String name;
  final String img;

  Participant({required this.name, required this.img});

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json['name'] ?? '',
      img: json['avatar_url'] ?? '',
    );
  }
}

class TripDates {
  final String start;
  final String end;

  TripDates({required this.start, required this.end});

  factory TripDates.fromJson(Map<String, dynamic> json) {
    return TripDates(
      start: json['start'] ?? '',
      end: json['end'] ?? '',
    );
  }
}