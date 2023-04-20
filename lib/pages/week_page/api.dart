
class TimeTables {
  List<TimeTable> timetables;

  TimeTables({required this.timetables});
  factory TimeTables.fromJson(Map<String, dynamic> json) => _itemFromJson(json);
}

TimeTables _itemFromJson(Map<String, dynamic> json) {
  var timetableJson = json['hydra:member'] as List;
  List<TimeTable> timetables =
      timetableJson.map((i) => TimeTable.fromJson(i)).toList();
  return TimeTables(timetables: timetables);
}

class TimeTable {
  int weekParity;
  int dayNumber;
  int lessonNumber;
  List<Teacher> teacher;
  List<Lesson> lesson;
  List<Location> location;
  List<Grup> grup;

  TimeTable(
      {required this.weekParity,
      required this.dayNumber,
      required this.lessonNumber,
      required this.teacher,
      required this.lesson,
      required this.location,
      required this.grup});
  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _timetableFromJson(json);
}

TimeTable _timetableFromJson(Map<String, dynamic> json) {
  var teacherJson = json['teacher'] as List;
  List<Teacher> teacher = teacherJson.map((i) => Teacher.fromJson(i)).toList();
  var lessonJson = json['lesson'] as List;
  List<Lesson> lesson = lessonJson.map((i) => Lesson.fromJson(i)).toList();
  var locationJson = json['location'] as List;
  List<Location> location =
      locationJson.map((i) => Location.fromJson(i)).toList();
  var grupJson = json['grup'] as List;
  List<Grup> grup = grupJson.map((i) => Grup.fromJson(i)).toList();
  return TimeTable(
      weekParity: json['weekParity'] as int,
      dayNumber: json['dayNumber'] as int,
      lessonNumber: json['lessonNumber'] as int,
      teacher: teacher,
      lesson: lesson,
      location: location,
      grup: grup);
}

class Teacher {
  String firstName;
  String lastName;
  String middleName;

  Teacher(
      {required this.firstName,
      required this.lastName,
      required this.middleName});
  factory Teacher.fromJson(Map<String, dynamic> json) => _teacherFromJson(json);
}

Teacher _teacherFromJson(Map<String, dynamic> json) => Teacher(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
    );

class Lesson {
  String name;
  String type;

  Lesson({required this.name, required this.type});
  factory Lesson.fromJson(Map<String, dynamic> json) => _lessonFromJson(json);
}

Lesson _lessonFromJson(Map<String, dynamic> json) => Lesson(
      name: json['name'] as String,
      type: json['type'] as String,
    );

class Location {
  String number;
  //String type;

  Location({required this.number});
  factory Location.fromJson(Map<String, dynamic> json) =>
      _locationFromJson(json);
}

Location _locationFromJson(Map<String, dynamic> json) => Location(
      number: json['number'] as String,
      //type: json['type'] as String ,
    );

class Grup {
  String name;

  Grup({required this.name});
  factory Grup.fromJson(Map<String, dynamic> json) => _grupFromJson(json);
}

Grup _grupFromJson(Map<String, dynamic> json) => Grup(
      name: json['name'] as String,
    );
