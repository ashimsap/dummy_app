enum AuthStatus { idle, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? message;
  final bool isLoggedIn;
  final int remainingSeconds; // For session countdown

  AuthState({
    this.status = AuthStatus.idle,
    this.message,
    this.isLoggedIn = false,
    this.remainingSeconds = 0,
  });
}
