class UserModel {
  final String id;
  final String phone;
  final String name;
  final String profilePicture;
  final DateTime updatedAt;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.profilePicture,
    required this.updatedAt,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      phone: data['phone'],
      name: data['name'],
      profilePicture: data['profilePicture'],
      updatedAt: data['updatedAt'],
      createdAt: data['createdAt'],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, phone: $phone, name: $name, profilePicture: $profilePicture, updatedAt: $updatedAt, createdAt: $createdAt)';
  }
}

class Class {
  final String institute;
  final String name;

  Class({required this.institute, required this.name});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      institute: json['institute'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Class{institute: $institute, name: $name}';
  }
}

class Institute {
  final String name;
  final String description;
  final String id;
  final String owner;

  Institute({
    required this.name,
    required this.description,
    required this.id,
    required this.owner,
  });

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
      name: json['name'],
      description: json['description'],
      id: json['id'],
      owner: json['owner'],
    );
  }

  @override
  String toString() {
    return 'Institute{name: $name, description: $description, id: $id, owner: $owner}';
  }
}
