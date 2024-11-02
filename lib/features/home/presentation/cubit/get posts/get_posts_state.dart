part of 'get_posts_cubit.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class GetPostsInitial extends GetPostsState {
  const GetPostsInitial();

  @override
  List<Object> get props => [];
}
final class GetPostsloading extends GetPostsState {
const GetPostsloading();
  @override
  List<Object> get props => [];
}
final class GetPostssuccess extends GetPostsState {
  final List<PostModel> posts;

 const GetPostssuccess({required this.posts});
 
  @override
  List<Object> get props => [posts];
}
final class GetPostsfailuare extends GetPostsState {
  final String errorMessage;

 const GetPostsfailuare({required this.errorMessage});
 
  @override
  List<Object> get props => [errorMessage];
}

