class Date {

  String id;
  String day;
  String month;
  String year;
  String dayName;
  bool isSelected = false;

  Date({this.id, this.day, this.month, this.year, this.dayName});

  factory Date.fromJson(Map<String, dynamic>json){
    return Date(
      id: json['id'] as String,
      day: json['day'] as String,
      month: json['month'] as String,
      year: json['year'] as String,
      dayName: json['day_name'] as String,
    );
  }
}