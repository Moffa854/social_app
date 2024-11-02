import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/domain/usecases/add_post_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AddPostUsecase _addPostUsecase;
  HomeCubit({required AddPostUsecase addPostUsecase})
      : _addPostUsecase = addPostUsecase,
        super(const HomeInitial());

  Future<void> addPost({required PostModel post}) async {
    emit(const Homeloading());
    final result = await _addPostUsecase.call(post: post);
    result.fold((l) {
      emit(Homefailuare(error: l.errorMessage));
    }, (r) {
      emit( Homesuccess(post: r));
    });
  }
}
