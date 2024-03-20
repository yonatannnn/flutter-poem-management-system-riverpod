import 'package:flutter/material.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/widgets/custom_button.dart';
import 'package:poem/widgets/custom_widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Text(
                    'Let\'s know you',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 66, 249),
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                  buttonText: 'sign in',
                  color: Color.fromARGB(255, 4, 213, 250),
                  onTap: LoginPage(),
                ),
              ),
              Expanded(
                child: CustomButton(
                  buttonText: 'sign Up',
                  color: Colors.blue,
                  onTap: SignUp(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
