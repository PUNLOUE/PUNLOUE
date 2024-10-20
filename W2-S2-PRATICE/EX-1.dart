 enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;

  Address(this.street, this.city);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // Constructor to initialize all attributes
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Named constructor for mobile developers
  Employee.mobileDeveloper(String name, double baseSalary, Address address, int yearsOfExperience)
      : _name = name,
        _baseSalary = baseSalary,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Method to compute the salary of the employee
  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  // Method to print the details of the employee
  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
    print('Skills: ${skills.map((skill) => skill.toString().split('.').last).join(', ')}');
    print('Address: ${address.street}, ${address.city}');
    print('Years of Experience: $yearsOfExperience');
    print('Computed Salary: \$${computeSalary()}');
  }
}

void main() {
  var address1 = Address('6A Preak leab St', 'Phnom Penh');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], address1, 5);
  emp1.printDetails();

  var address2 = Address('6A Preak leab St', 'Phnom Penh');
  var emp2 = Employee.mobileDeveloper('Ronan', 45000, address2, 3);
  emp2.printDetails();
}