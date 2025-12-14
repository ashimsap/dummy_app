import 'package:dummy_app/ui/screens/homapage.dart';
import 'package:dummy_app/ui/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/auth_notifiers.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (authState.isLoggedIn) {
      return HomeScreen();
    } else {
      return LoginScreen(); // or you can start with RegisterScreen
    }
  }
}
