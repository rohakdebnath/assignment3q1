import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Make Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: rollNoController,
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        nameController: nameController,
                        emailController: emailController,
                        rollNoController: rollNoController,
                        phoneNumberController: phoneNumberController,
                      ),
                    ),
                  ).then((_) {

                    // Show the logout SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('User ${nameController.text} Logged out'),
                      ),
                    );
                    nameController.text = '';
                    emailController.text = '';
                    rollNoController.text = '';
                    phoneNumberController.text = '';
                  });
                },
                child: const Text('Show Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController rollNoController;
  final TextEditingController phoneNumberController;
  const SecondPage({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.rollNoController,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${nameController.text}'),
            Text('Email: ${emailController.text}'),
            Text('Roll No: ${rollNoController.text}'),
            Text('Phone Number: ${phoneNumberController.text}'),
          ],
        ),
      ),
    );
  }
}
