import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/domain/repositories/post_repo.dart';

class AddPostUsecase {
  final PostRepo _postRepo;

  AddPostUsecase({required PostRepo postRepo}) : _postRepo = postRepo;

  Future<Either<FialureServer, PostModel>> call(
      {required PostModel post}) async {
    return await _postRepo.addPost(post: post);
  }
}
