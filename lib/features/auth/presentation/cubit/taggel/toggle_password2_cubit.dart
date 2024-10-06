import 'package:flutter_bloc/flutter_bloc.dart';

class TogglePassword2Cubit extends Cubit<bool> {
  TogglePassword2Cubit() : super(false);
  void togglepassword2() => emit(!state);
}