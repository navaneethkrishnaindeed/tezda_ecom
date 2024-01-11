import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  login({required String email, required String password}) async {
    var res = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(res.user);
  }
}
