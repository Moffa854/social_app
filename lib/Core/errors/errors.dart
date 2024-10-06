
abstract class Failure implements Exception {
  final String errorMessage;

  Failure({required this.errorMessage});
}


class ServerFailure extends Failure {
  ServerFailure() : super(errorMessage: 'Server failure occurred');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(errorMessage: 'Network failure occurred');
}


