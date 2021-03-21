import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic? properties;
  Failure({this.properties});
  @override
  List<Object> get props => [properties];

  // Failure([List properties = const <dynamic>[]]);
}
