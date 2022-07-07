part of 'github_bloc.dart';

@immutable 
abstract class GithubState {}

class GithubInitial extends GithubState{}

class GithubLoading extends GithubState{}

class GithubLoadSuccess extends GithubState{
  final String imageUrl;

  GithubLoadSuccess(this.imageUrl);
}

class GithubError extends GithubState{}
