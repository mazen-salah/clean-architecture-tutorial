import 'package:cleanArchitecture/data/user_data_source.dart';
import 'package:cleanArchitecture/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserDataSource implements UserDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addUser(User user, {String? id}) async {
    final collection = _firestore.collection('users');
    if (id == null || id.isEmpty) {
      await collection.add(user.toMap());
    } else {
      await collection.doc(id).set(user.toMap());
    }
  }

  @override
  Future<List<User>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();
    return snapshot.docs.map((doc) => User.fromMap(doc.data())).toList();
  }
}
