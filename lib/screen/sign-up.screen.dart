import 'package:flutter/material.dart';
import 'package:flutter_note/providers/user.provider.dart';
import 'package:flutter_note/widget/loading-indicator.widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  LoadingIndicator.showLoadingDialog(context);
                  await AppUser.instance.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                  );
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       content: Text(
                  //           'User ${emailController.text} has been registered'),
                  //     );
                  //   },
                  // );
                } catch (e) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(e.toString()),
                      );
                    },
                  );
                }
              },
              child: Text('Sign Up '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Sign In '),
            )
          ],
        ),
      ),
    );
  }
}
