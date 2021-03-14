import 'package:clean_architecture_tdd/core/platforms/networl_info.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/data_sources/number_trivia_local_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/data_sources/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([NumberTriviaLocalDataSource])
@GenerateMocks([NumberTriviaRemoteDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  late NumberTriviaRepositoryImpl repositoryImpl;
  final mockNumberTriviaLocalDataSource = MockNumberTriviaLocalDataSource();
  final mockNumberTriviaRemoteDataSource = MockNumberTriviaRemoteDataSource();
  final mockNetworkInfo = MockNetworkInfo();

  setUp(() {
    repositoryImpl = NumberTriviaRepositoryImpl(
      numberTriviaLocalDataSource: mockNumberTriviaLocalDataSource,
      numberTriviaRemoteDataSource: mockNumberTriviaRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
