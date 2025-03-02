import 'dart:io';

void main() {
  
  Map students = {};

  while (true) {
    stdout.write("Enter student name (or 'done' to finish): ");
    String? name = stdin.readLineSync();

    if (name?.toLowerCase() == 'done') {
      break;
    }

    
    stdout.write("Enter $name's grade: ");
    String? std_grade = stdin.readLineSync();

    
    try {
      double grade = double.parse(std_grade!);
      if (grade < 0 || grade > 100) {
        print("Invalid grade. Please enter a value between 0 and 100.\n");
      } else {
        
        students[name!] = grade;
        print("$name's grade of $grade has been added.\n");
      }
    } catch (e) {
      print("Invalid input. Please enter a numeric value.\n");
    }
  }

  double highest_Grade = students.values.reduce((a, b) => a > b ? a : b);
  double lowest_Grade = students.values.reduce((a, b) => a < b ? a : b);
  double total = students.values.reduce((a, b) => a + b);
  double average_Grade = total / students.length;

  print("Results :");
  print("Highest Grade: $highest_Grade (${students.entries.firstWhere((entry) => entry.value == highest_Grade).key})");
  print("Lowest Grade: $lowest_Grade (${students.entries.firstWhere((entry) => entry.value == lowest_Grade).key})");
  print("Average Grade: ${average_Grade.toStringAsFixed(1)}");

  var sortedStudents = students.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  print("\nGrades from highest to lowest:");
  for (var entry in sortedStudents) {
    print("${entry.key}: ${entry.value}");
  }
}