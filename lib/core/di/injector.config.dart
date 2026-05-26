// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/character/data/datasource/remote_datasource.dart'
    as _i424;
import '../../feature/character/data/repository/character_repository_impl.dart'
    as _i812;
import '../../feature/character/domain/repository/character_repository.dart'
    as _i192;
import '../../feature/character/presentation/character_provider.dart' as _i593;
import '../router/router.dart' as _i285;
import 'module/app_module.dart' as _i106;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i285.AppRouter>(() => appModule.appRouter);
    gh.factory<_i424.RemoteDatasource>(() => _i424.RemoteDatasourceImpl());
    gh.factory<_i192.CharacterRepository>(
      () => _i812.CharacterRepositoryImpl(gh<_i424.RemoteDatasource>()),
    );
    gh.factory<_i593.CharacterProvider>(
      () => _i593.CharacterProvider(gh<_i192.CharacterRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i106.AppModule {}
