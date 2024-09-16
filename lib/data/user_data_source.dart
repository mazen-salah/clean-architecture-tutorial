import 'package:cleanArchitecture/models/user_model.dart';

abstract class UserDataSource {
  Future<void> addUser(User user, {String? id});
  Future<List<User>> getUsers();
}
