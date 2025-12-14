import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifiers/auth_notifiers.dart';
import '../../state/auth_states.dart';
import 'login_form.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous?.isLoggedIn == true && next.isLoggedIn == false) {
        if (next.message != null) {
          // Show snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.message!),
              duration: Duration(seconds: 2), // visible for 2 seconds
            ),
          );

          // Delay navigation slightly to allow snackbar to appear
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          });
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      }
    });


    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are logged in!'),
            SizedBox(height: 20),
            Text(
              'Session expires in: ${authState.remainingSeconds} seconds',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
