part of 'create_flat_bloc.dart';

@immutable
abstract class CreateFlatState {}

abstract class CreateFlatPageState extends CreateFlatState {}

class CreateFlatFirst extends CreateFlatPageState {}

class CreateFlatSecond extends CreateFlatPageState {}

class CreateFlatThird extends CreateFlatPageState {}
