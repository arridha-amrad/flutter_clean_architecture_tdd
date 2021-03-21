import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/num_trivia_repository.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia useCase;
  final mockNumberTriviaRepository = MockNumberTriviaRepository();

  setUp(() {
    useCase = GetConcreteNumberTrivia(repository: mockNumberTriviaRepository);
  });

  final tNumberTrivia2 = NumberTrivia(text: 'test', number: 2);
  final tNumber2 = 2;

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumber(any))
        .thenAnswer((_) async => Right(tNumberTrivia2));
    // act
    final result = await useCase.execute(tNumber2);
    // assert
    expect(result, Right(tNumberTrivia2));
    verify(mockNumberTriviaRepository.getConcreteNumber(tNumber2));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
