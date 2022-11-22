import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EpydocFirebaseUser {
  EpydocFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EpydocFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EpydocFirebaseUser> epydocFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EpydocFirebaseUser>(
      (user) {
        currentUser = EpydocFirebaseUser(user);
        return currentUser!;
      },
    );
