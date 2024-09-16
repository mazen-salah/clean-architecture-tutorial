import 'package:cleanArchitecture/data/user_data_source.dart';
import 'package:cleanArchitecture/models/user_model.dart';

class DummyUserDataSource implements UserDataSource {
  final List<User> _dummyUsers = [
    User(name: 'John Doe', age: 25, role: 'Donor'),
    User(name: 'Jane Smith', age: 30, role: 'Patient'),
  ];

  @override
  Future<void> addUser(User user, {String? id}) async {
    // For dummy data, just add the user to the list
    _dummyUsers.add(user);
  }

  @override
  Future<List<User>> getUsers() async {
    // Return dummy users
    return Future.value(_dummyUsers);
  }
}
