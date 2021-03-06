import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/network/network_info.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/repository_impl.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/authentication_repository_contract.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_out.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/repository_impl.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_create_flat.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user_from_cloud.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user_from_memory.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_update_user.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory(() {
    return AuthenticationBloc(
      useCreateUserWithEmailAndPassword: sl(),
      useSignInUserWithEmailAndPassword: sl(),
      useSignOut: sl(),
    );
  });

  sl.registerFactory(() {
    return CurrentUserInfoBloc(
      useRetrieveUserFromCloud: sl(),
      useRetrieveUserFromMemory: sl(),
      useCreateFlat: sl(),
      useUpdateUser: sl(),
    );
  });

  sl.registerLazySingleton(() {
    return UseCreateUserWithEmailAndPassword(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseSignInUserWithEmailAndPassword(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseCreateFlat(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseUpdateUser(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseSignOut(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseRetrieveUserFromCloud(repository: sl());
  });
  sl.registerLazySingleton(() {
    return UseRetrieveUserFromMemory(repository: sl());
  });

  sl.registerLazySingleton<AuthenticationRepositoryContract>(() {
    return AuthenticationRepositoryImpl(
      datasource: sl(),
      networkInfoImpl: sl(),
    );
  });
  sl.registerLazySingleton<CurrentUserInfoRepositoryContract>(() {
    return CurrentUserInfoRepositoryImpl(datasource: sl());
  });

  sl.registerLazySingleton<AuthenticationDatasourceContract>(() {
    return AuthenticationDatasourceRemote(
      firebaseAuthInstance: sl(),
      firebaseCloudInstance: sl(),
    );
  });
  sl.registerLazySingleton<CurrentUserInfoDatasourceContract>(() {
    return CurrentUserInfoDatasourceRemote(firebaseCloudInstance: sl());
  });

  sl.registerLazySingleton<NetworkInfoContract>(() {
    return NetworkInfoImpl(dataConnectionChecker: sl());
  });

  sl.registerLazySingleton(() {
    return DataConnectionChecker();
  });

  sl.registerLazySingleton(() {
    return FirebaseAuth.instance;
  });
  sl.registerLazySingleton(() {
    return FirebaseFirestore.instance;
  });
}
