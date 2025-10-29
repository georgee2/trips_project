class ItemModel {
  final String id;
  final String status;
  final String title;
  final String coverImg;
  final String tasks;
  final TripDates dates;
  final List<Participant> participants;

  ItemModel({
    required this.id,
    required this.status,
    required this.title,
    required this.coverImg,
    required this.tasks,
    required this.dates,
    required this.participants,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      title: json['title'] ?? '',
      coverImg: json['cover_image'] ?? '',
      tasks: json['unfinished_tasks']?.toString() ?? '0',
      dates: TripDates.fromJson(json['dates'] ?? {}),
      participants: (json['participants'] as List<dynamic>? ?? [])
          .map((e) => Participant.fromJson(e))
          .toList(),
    );
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