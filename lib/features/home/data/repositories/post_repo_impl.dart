import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/Core/errors/server_exception.dart';
import 'package:social_app/features/home/data/datasources/remote/post_remote_date_source.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/domain/repositories/post_repo.dart';

class PostRepoImpl implements PostRepo {
  final PostRemoteDateSource _postRemoteDateSource;

  PostRepoImpl({required PostRemoteDateSource postRemoteDateSource}) : _postRemoteDateSource = postRemoteDateSource;
  @override
  Future<Either<FialureServer, PostModel>> addPost({required PostModel post})async {
    try {
      final newpost =await _postRemoteDateSource.addPost(post: post);
      return Right(newpost);
    } on ServerException catch (e) {
      return Left(FialureServer(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<FialureServer, List<PostModel>>> getPosts() async{
    try {
      final getposts =await _postRemoteDateSource.getPosts();
      return Right(getposts);
    } on ServerException catch (e) {
      return Left(FialureServer(errorMessage: e.errorMessage));
    }
  }
}
