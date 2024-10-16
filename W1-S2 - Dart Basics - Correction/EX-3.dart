void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // Filtering the scores to find students who passed
  List<int> passedStudents = scores.where((score) => score >= 50).toList();

  // Displaying the filtered list and the number of students who passed
  print("Students who passed: $passedStudents");
  print("Number of students who passed: ${passedStudents.length}");
}