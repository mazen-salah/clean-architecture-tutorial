import 'package:cleanArchitecture/widgets/role_radio_widget.dart';
import 'package:cleanArchitecture/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  String role = 'Donor';

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: idController,
            decoration: InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoleRadio(
                role: 'Donor',
                groupValue: role,
                onChanged: (value) {
                  setState(() {
                    role = value!;
                  });
                },
              ),
              RoleRadio(
                role: 'Patient',
                groupValue: role,
                onChanged: (value) {
                  setState(() {
                    role = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => userViewModel.addUser(
              nameController.text,
              ageController.text,
              role,
              id: idController.text.isEmpty ? null : idController.text,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Add User'),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: userViewModel.fetchUsers,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Read User'),
          ),
          if (userViewModel.errorMessage.isNotEmpty)
            Text(userViewModel.errorMessage,
                style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
