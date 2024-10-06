import 'package:flutter_bloc/flutter_bloc.dart';

class TogglePassword3Cubit extends Cubit<bool> {
  TogglePassword3Cubit() : super(false);
  void togglepassword3() => emit(!state);
}