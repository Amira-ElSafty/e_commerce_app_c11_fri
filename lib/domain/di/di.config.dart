// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_manager.dart' as _i3;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i4;
import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i5;
import '../../data/repository/auth_repository_impl.dart' as _i7;
import '../../features/auth/presentation/screens/register/cubit/register_view_model.dart'
    as _i9;
import '../repository/auth_repository.dart' as _i6;
import '../use_cases/register_use_case.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepository>(() => _i7.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i4.AuthRemoteDataSource>()));
    gh.factory<_i8.RegisterUseCase>(
        () => _i8.RegisterUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i9.RegisterViewModel>(() =>
        _i9.RegisterViewModel(registerUseCase: gh<_i8.RegisterUseCase>()));
    return this;
  }
}
