import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/domain/usecases/get_post_usecase.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  final GetPostUsecase _getPostUsecase;
  GetPostsCubit({required GetPostUsecase getPostUsecase}) : 
  _getPostUsecase = getPostUsecase, super(const GetPostsInitial());
  Future<List<PostModel>> getPosts() async {
    emit(const GetPostsloading());
    final result = await _getPostUsecase.call();
   return result.fold((l) {
      emit( GetPostsfailuare(errorMessage: l.errorMessage));
      return [];
    }, (r) {
      emit( GetPostssuccess(posts: r));
      return r;
    });
  }
}
