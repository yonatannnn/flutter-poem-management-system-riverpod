import 'package:flutter/material.dart';
import 'package:poem/widgets/custom_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
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
        fontWeight: FontWeight.w900,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [Colors.black87, Colors.yellow],
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
      // add more complex username validation logic here
      return null;
    },
  );
  final email = TextFormField(
    decoration: InputDecoration(
      prefixIcon: const Icon(
        Icons.email,
        color: Colors.green,
      ),
      labelText: 'Email',
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
        return 'Please enter your email';
      }
      // add more complex email validation logic here
      return null;
    },
  );
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
            colors: [
              Color.fromARGB(255, 33, 240, 243),
              Color.fromARGB(255, 175, 97, 76)
            ],
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
      //add more complex password validation logic here
      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 5,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.only(left: 22),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: _formMethod(context),
            ),
          ),
        ],
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
            'Welcome to a Poetry Haven!',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          username,
          const Padding(padding: EdgeInsets.all(4.0)),
          email,
          const Padding(padding: EdgeInsets.all(3.0)),
          password,
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //  API calls here.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form submitted'),
                    ),
                  );
                }
              },
              child: const Text('Sign Up'),
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
                  'sign up with',
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
                icon: Image.asset('assets/images/download.png', height: 20.0),
                label: const Text('sign up with google'),
              )
            ],
          )
        ],
      ),
    );
  }
}
