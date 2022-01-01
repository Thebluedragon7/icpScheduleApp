class ICPPeriod {
  final String startTime;
  final String endTime;
  final String type;
  final String moduleCode;
  final String moduleTitle;
  final String lecturer;
  final String block;
  final String room;
  const ICPPeriod({
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.moduleCode,
    required this.moduleTitle,
    required this.lecturer,
    required this.block,
    required this.room,
});
}

class ICPDay {
  final String type;
  final List<ICPPeriod> periods;
  const ICPDay({
    required this.type,
    required this.periods,
});
}