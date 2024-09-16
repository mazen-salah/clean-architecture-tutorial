import 'dart:developer';

import 'package:cleanArchitecture/models/user_model.dart';
import 'package:cleanArchitecture/repositories/user_repo.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  List<User> _users = [];
  List<User> get users => _users;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  UserViewModel(this._userRepository);

  Future<void> addUser(String name, String ageText, String role,
      {String? id}) async {
    final age = int.tryParse(ageText);
    if (name.isEmpty || age == null) {
      _errorMessage = 'Please enter valid name and age.';
      notifyListeners();
      return;
    }
    final user = User(name: name, age: age, role: role);
    await _userRepository.addUser(user, id: id);
    fetchUsers(); // Refresh list
  }

  Future<void> fetchUsers() async {
    _users = await _userRepository.fetchUsers();
    log('Users: ${_users.map((user) => user.toMap()).toList()}');
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
