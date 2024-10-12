import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);

    void changeIndex(int index) {
    emit(index); 
  }
}
