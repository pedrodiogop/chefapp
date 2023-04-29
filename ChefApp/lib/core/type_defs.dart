// typedef serve para criar a nossa propria variavel 
 import 'package:fpdart/fpdart.dart';
 import 'package:chefapp/core/failure.dart';

// criamos uma varaivel isto para nos ajudar no handling error 
typedef  FutureEither<T> = Future<Either<Failure,T>>;

// sucesso nao vai retornar nada 
typedef FutureVoid = FutureEither<void>;

// <T> -> isto para darmos qualquer tipo a variavel 