final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, isImportant, number, description, contact, lincense, regnumber,
    region, district, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String contact = 'contact';
  static final String lincense = 'license';
  static final String regnumber = 'regnumber';
  static final String region = 'region';
  static final String district = 'district';
  static final String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final String contact;
  final String lincense;
  final String regnumber;
  final String region;
  final String district;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.contact,
    required this.lincense,
    required this.regnumber,
    required this.region,
    required this.district,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    String? contact,
    String? lincense,
    String? regnumber,
    String? region,
    String? district,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        contact: contact ?? this.contact,
        lincense: lincense ?? this.lincense,
        regnumber: regnumber ?? this.regnumber,
        region: region ?? this.region,
        district: district ?? this.district,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        contact: json[NoteFields.contact] as String,
        lincense: json[NoteFields.lincense] as String,
        regnumber: json[NoteFields.regnumber] as String,
        region: json[NoteFields.region] as String,
        district: json[NoteFields.district] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.contact: contact,
        NoteFields.lincense: lincense,
        NoteFields.regnumber: regnumber,
        NoteFields.region: region,
        NoteFields.district: district,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
