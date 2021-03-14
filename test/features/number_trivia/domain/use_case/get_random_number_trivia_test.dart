import 'package:clean_architecture_tdd/core/use_cases/use_cases.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/num_trivia_repository.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetRandomNumberTrivia useCase;
  final mockNumberTriviaRepository = MockNumberTriviaRepository();

  setUp(() {
    useCase = GetRandomNumberTrivia(repository: mockNumberTriviaRepository);
  });

  final tNumberTrivia2 = NumberTrivia(text: 'test', number: 2);

  test('should get trivia for a random number from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getRandomNumber())
        .thenAnswer((_) async => Right(tNumberTrivia2));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, Right(tNumberTrivia2));
    verify(mockNumberTriviaRepository.getRandomNumber());
  });
}
