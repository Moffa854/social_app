import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/domain/repositories/post_repo.dart';

class GetPostUsecase {
  final PostRepo _postRepo;

  GetPostUsecase({required PostRepo postRepo}) : _postRepo = postRepo;
  Future<Either<FialureServer, List<PostModel>>> call() async {
    return await _postRepo.getPosts();
  }
}
