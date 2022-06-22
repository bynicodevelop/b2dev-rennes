import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      print('name: ${_nameController.text}');
    });

    _emailController.addListener(() {
      print('Email: ${_emailController.text}');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add content'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _emailController.text.isEmpty) {
                        print("Error: Name or email is empty");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Name or email is empty'),
                          ),
                        );

                        return;
                      }

                      print('Name: ${_nameController.text}');
                      print('Email: ${_emailController.text}');
                    },
                    child: const Text("Enregister"),
                  ),
                )
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Password',
                //     suffixIcon: IconButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.remove_red_eye),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
