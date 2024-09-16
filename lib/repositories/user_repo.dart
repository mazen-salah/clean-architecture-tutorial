import 'package:cleanArchitecture/data/user_data_source.dart';
import 'package:cleanArchitecture/models/user_model.dart';

class UserRepository {
  final UserDataSource _dataSource;

  UserRepository(this._dataSource);

  Future<void> addUser(User user, {String? id}) {
    return _dataSource.addUser(user, id: id);
  }

  Future<List<User>> fetchUsers() {
    return _dataSource.getUsers();
  }
}
