import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleChooseGender extends Cubit<String> {
  ToggleChooseGender() : super('');
  void chooseGender(String gender) {
    emit(gender);
  }
}
