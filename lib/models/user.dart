import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  User({
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return "User(name: $name, age: $age)";
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  static User fromJson(dynamic data) {
    final Map<String, dynamic> map = data;
    return User(
      name: map["name"],
      age: map["age"],
    );
  }

  @override
  int get hashCode => Object.hash(name, age);
}
