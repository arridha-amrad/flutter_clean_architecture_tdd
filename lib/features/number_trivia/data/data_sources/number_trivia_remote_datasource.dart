import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// calls https://numbersapi.com/${number}
  /// throws [Server Exception] for error code
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// calls https://numbersapi.com/random
  /// throws [Server Exception] for error code
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
