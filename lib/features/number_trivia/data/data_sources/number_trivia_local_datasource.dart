import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// get the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection
  /// Throws [CacheException] if no cached data is presented
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
