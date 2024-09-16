import 'package:cleanArchitecture/data/dummy_data.dart';
import 'package:cleanArchitecture/firebase_options.dart';
import 'package:cleanArchitecture/data/firestore_data.dart';
import 'package:cleanArchitecture/repositories/user_repo.dart';
import 'package:cleanArchitecture/views/user_view.dart';
import 'package:cleanArchitecture/view_models/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const isProduction = false; // Toggle this for using Firestore or Dummy

  final userDataSource =
      // ignore: dead_code
      isProduction ? FirestoreUserDataSource() : DummyUserDataSource();

  runApp(MainApp(userRepository: UserRepository(userDataSource)));
}

class MainApp extends StatelessWidget {
  final UserRepository userRepository;

  const MainApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(userRepository),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('User Form'),
          ),
          body: const Center(
            child: UserForm(),
          ),
        ),
      ),
    );
  }
}
