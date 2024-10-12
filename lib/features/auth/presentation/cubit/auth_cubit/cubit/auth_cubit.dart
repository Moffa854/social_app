import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/signin_with_google.dart';
import 'package:social_app/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final SignupUsecase _signupUseCase;
  final LogoutUsecase _logoutUseCase;
  final ForgetPasswordUsecase _forgetPasswordUsecase;
  final SigninWithGoogleUseCase _signinWithGoogleUseCase;
  AuthCubit({
    required LoginUseCase loginUseCase,
    required ForgetPasswordUsecase forgetPasswordusecase,
    required SignupUsecase signupUseCase,
    required SigninWithGoogleUseCase signinWithGoogleUseCase,
    required LogoutUsecase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _signupUseCase = signupUseCase,
        _forgetPasswordUsecase = forgetPasswordusecase,
        _logoutUseCase = logoutUseCase,
        _signinWithGoogleUseCase = signinWithGoogleUseCase,
        super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(const Homeloading());
    Either<Failure, void> result = await _loginUseCase.call(email, password);
    result.fold((failure) {
      emit(HomeError(error: failure.errorMessage));
    }, (r) {
      emit(Homesuccess());
    });
  }

  Future<void> signup(String email, String password) async {
    emit(const Homeloading());
    Either<Failure, void> result = await _signupUseCase.call(email, password);
    result.fold((failure) {
      emit(HomeError(error: failure.errorMessage));
    }, (r) {
      emit(Homesuccess());
    });
  }

  Future<void> logout() async {
    await _logoutUseCase.call();
  }

  Future<void> signinWithGoogle() async {
    emit(const Homeloading());
    Either<Failure, void> result = await _signinWithGoogleUseCase.call();
    result.fold((failure) {
      emit(HomeError(error: failure.errorMessage));
    }, (r) {
      emit(Homesuccess());
    });
  }

  Future<void> forgetPassword(String email) async {
    emit(const Homeloading());
    Either<Failure, void> result = await _forgetPasswordUsecase.call(email);
    result.fold((failure) {
      emit(HomeError(error: failure.errorMessage));
    }, (r) {
      emit(Homesuccess());
    });
  }
}
