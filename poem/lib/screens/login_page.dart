import 'package:flutter/material.dart';
import 'package:poem/screens/home_page.dart';
import 'package:poem/widgets/custom_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final password = TextFormField(
    decoration: InputDecoration(
      prefixIcon: const Icon(
        Icons.lock,
        color: Colors.red,
      ),
      labelText: 'Password',
      border: const OutlineInputBorder(),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [Colors.black54, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
      ),
    ),
    style: const TextStyle(
      color: Colors.black87,
    ),
    obscureText: true,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter your password';
      }

      return null;
    },
  );

  final username = TextFormField(
    decoration: InputDecoration(
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.blue,
      ),
      labelText: 'Username',
      border: const OutlineInputBorder(),
      labelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
      ),
    ),
    style: const TextStyle(
      color: Colors.black87,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter your username';
      }

      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 12,
            ),
          ),
          _expandedForm(context),
        ],
      ),
    );
  }

  Expanded _expandedForm(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        padding: const EdgeInsets.only(left: 22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: _formMethod(context),
      ),
    );
  }

  Form _formMethod(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            'Welcome to the Poetry Haven!',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          username,
          const Padding(padding: EdgeInsets.all(4.0)),
          password,
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // API calls here.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: const Text('Sign In'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.8,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: Text(
                  'sign in with',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.8,
                  color: Colors.grey.withOpacity(0.6),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/download.png', height: 24.0),
                label: const Text('sign in with google'),
              )
            ],
          )
        ],
      ),
    );
  }
}
