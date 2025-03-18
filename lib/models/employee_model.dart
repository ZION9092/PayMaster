class Employee {
  final String id;
  final String name;
  final String email;
  final String jobTitle;
  final int salary;
  final List<Deduction> deductions;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.salary,
    required this.deductions,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      jobTitle: json["jobTitle"],
      salary: json["salary"],
      deductions: (json["deductions"] as List)
          .map((deduction) => Deduction.fromJson(deduction))
          .toList(),
    );
  }
}

class Deduction {
  final String deductionId;
  final String name;
  final int amount;

  Deduction({
    required this.deductionId,
    required this.name,
    required this.amount,
  });

  factory Deduction.fromJson(Map<String, dynamic> json) {
    return Deduction(
      deductionId: json["deductionId"],
      name: json["name"],
      amount: json["amount"],
    );
  }
}
