// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:autogas/core/usesCases/auth/auth_usescases.dart' as _i453;
import 'package:autogas/core/usesCases/users/users_usecases.dart' as _i1059;
import 'package:autogas/di/app_module.dart' as _i767;
import 'package:autogas/features/auth/data/data.dart' as _i1051;
import 'package:autogas/features/auth/domain/domain.dart' as _i424;
import 'package:autogas/features/profile/data/datasources/users_datasource_impl.dart'
    as _i537;
import 'package:autogas/features/profile/domain/repositories/users_repository.dart'
    as _i975;
import 'package:autogas/features/shared/infrastructure/services/shared_preferences_storage_service.dart'
    as _i570;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i570.SharedPreferencesStorageService>(
      () => appModule.sharedPref,
    );
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i1051.AuthDataSourceImpl>(() => appModule.authDatasourceImpl);
    gh.factory<_i537.UsersDatasourceImpl>(() => appModule.usersDatasourceImpl);
    gh.factory<_i424.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i975.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i453.AuthUsescases>(() => appModule.authUsescases);
    gh.factory<_i1059.UsersUsecases>(() => appModule.usersUsecase);
    return this;
  }
}

class _$AppModule extends _i767.AppModule {}
