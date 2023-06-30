import 'dart:developer';

import 'package:chatrealm/src/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../realm/app_service.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginState extends ConsumerState<Login> {
  bool register = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      register = true;
                      setState(() {});
                    },
                    child: const Text("Register")),
                TextButton(
                    onPressed: () {
                      register = false;
                      setState(() {});
                    },
                    child: const Text("Login"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (register)
              Column(
                children: [
                  TextField(
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                  ),
                  TextButton(
                      onPressed: () async {
                        await ref.read(appserviceProvider).register(
                            emailController.text, passwordController.text);
                        log("message >>");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: const Text("Register"))
                ],
              ),
            if (!register)
              Column(
                children: [
                  TextField(
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                  ),
                  TextButton(
                      onPressed: () async {
                        await ref.read(appserviceProvider).login(
                            emailController.text, passwordController.text);
                        log("message");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: const Text("Login"))
                ],
              )
          ],
        ),
      ),
    );
  }
}
