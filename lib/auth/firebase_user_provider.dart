import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BusAppFirebaseUser {
  BusAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BusAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BusAppFirebaseUser> busAppFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BusAppFirebaseUser>(
      (user) {
        currentUser = BusAppFirebaseUser(user);
        return currentUser!;
      },
    );
