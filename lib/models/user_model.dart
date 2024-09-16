class User {
  final String name;
  final int age;
  final String role;

  User({required this.name, required this.age, this.role = 'Donor'});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      role: map['role'],
    );
  }
}
