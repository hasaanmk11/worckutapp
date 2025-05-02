import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 4)
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @HiveField(2)
  String id;

  UserModel({required this.username, required this.id, required this.password});
}
