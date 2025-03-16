class ScheduleInfo {
  const ScheduleInfo(
      {required this.building,
      required this.id,
      required this.courseName,
      required this.day,
      required this.docImage,
      required this.docName,
      required this.room,
      required this.time,
      required this.docBldg,
      required this.docRoom,
      required this.docEmail,});
  final String id;
  final String docImage;
  final String docName;
  final String courseName;
  final String building;
  final String room;
  final String time;
  final String day;
  final String docBldg;
  final String docRoom;
  final String docEmail;
}