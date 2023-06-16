class User {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  // Додадете ги другите атрибути според вашите потреби

  User({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    // Иницијализирајте ги останатите атрибути
  });

  set id(int id) {}

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }
}
