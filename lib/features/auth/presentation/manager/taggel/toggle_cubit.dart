import 'package:flutter_bloc/flutter_bloc.dart';

class TogglePassword1Cubit extends Cubit<bool> {
  TogglePassword1Cubit() : super(false);
  void togglepassword() => emit(!state);
}
