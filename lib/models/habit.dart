class Habit {
  final String id;
  final String title;
  List<String> reasons;
  int longestStreak;
  int currentStreak;
  List<String> commitmentIds;

  Habit(this.id, this.title);
}