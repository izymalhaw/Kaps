import 'package:flutter_test/flutter_test.dart';
import 'package:kaps/features/authentication/presentation/pages/Signin.dart';

void main() {
  test('build', () {
    var widget = SignIn();
    expect(widget, isNotNull);
  });

  test('isSwitched initializes to true', () {
    var state = _SignInState();
    expect(state.isSwitched, isTrue);
  });

  test('status initializes to false', () {
    var state = _SignInState();
    expect(state.status, isFalse);
  });

  test('onSwitchChanged updates isSwitched', () {
    var state = _SignInState();
    state.onSwitchChanged(false);
    expect(state.isSwitched, isFalse);
  });

  test('checkValidity returns error if phone is empty', () {
    var state = _SignInState();
    var error = state.checkValidity('');
    expect(error, 'Phone cant be empty');
  });

  test('checkValidity returns null if phone is not empty', () {
    var state = _SignInState();
    var error = state.checkValidity('123');
    expect(error, isNull);
  });

  test('checkValidity returns error if password is empty', () {
    var state = _SignInState();
    var error = state.checkValidity('');
    expect(error, 'Password cant be Empty');
  });

  test('checkValidity returns null if password is not empty', () {
    var state = _SignInState();
    var error = state.checkValidity('password');
    expect(error, isNull);
  });
}

class _SignInState {
  get isSwitched => null;
  
  get status => null;

  checkValidity(String s) {}
  
  void onSwitchChanged(bool bool) {}
}
