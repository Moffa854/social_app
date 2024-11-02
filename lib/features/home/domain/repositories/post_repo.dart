import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/home/data/models/post_model.dart';

abstract class PostRepo {
  Future<Either<FialureServer,PostModel>> addPost({required PostModel post});
  Future<Either<FialureServer,List<PostModel>>> getPosts();
}