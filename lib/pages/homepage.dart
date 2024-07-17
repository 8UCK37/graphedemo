import 'package:flutter/material.dart';
import 'package:graphedemo/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          alignment: const AlignmentDirectional(0, -1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             GestureDetector(
                onTap: () {
                  AuthService().signOut(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Text("Sign out"),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}