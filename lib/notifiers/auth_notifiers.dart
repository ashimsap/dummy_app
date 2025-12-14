import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import '../models/users.dart';
import '../state/auth_states.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  final Map<String, User> _registeredUsers = {};
  Timer? _sessionTimer;
  final int sessionDuration = 15; // seconds for testing

  void register(String email, String password) {
    state = AuthState(status: AuthStatus.loading);

    Future.delayed(Duration(seconds: 1), () {
      if (_registeredUsers.containsKey(email)) {
        state = AuthState(status: AuthStatus.error, message: 'Email already registered');
      } else {
        _registeredUsers[email] = User(email: email, password: password);
        state = AuthState(status: AuthStatus.success, message: 'Registered!');
      }
    });
  }

  void login(String email, String password) {
    state = AuthState(status: AuthStatus.loading);

    Future.delayed(Duration(seconds: 1), () {
      if (_registeredUsers.containsKey(email) &&
          _registeredUsers[email]!.password == password) {
        _startSession();
        state = AuthState(
          status: AuthStatus.success,
          message: 'Login successful!',
          isLoggedIn: true,
          remainingSeconds: sessionDuration,
        );
      } else {
        state = AuthState(status: AuthStatus.error, message: 'Invalid credentials');
      }
    });
  }

  void logout({String message = 'Session expired. Please login again.'}) {
    _sessionTimer?.cancel();
    state = AuthState(status: AuthStatus.idle, message: message, isLoggedIn: false);
  }

  void _startSession() {
    _sessionTimer?.cancel();
    int secondsLeft = sessionDuration;

    _sessionTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsLeft--;
      if (secondsLeft <= 0) {
        logout();
      } else {
        state = AuthState(
          status: AuthStatus.success,
          isLoggedIn: true,
          remainingSeconds: secondsLeft,
        );
      }
    });
  }
}
