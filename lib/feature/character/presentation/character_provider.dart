import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';
import 'package:rickandmorty/feature/character/domain/repository/character_repository.dart';

enum CharacterState {
  initial,
  loading,
  loaded,
  error,
}

@injectable
class CharacterProvider extends ChangeNotifier {
  final CharacterRepository _characterRepository;

  CharacterState _state = CharacterState.initial;
  List<Character> _characters = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;
  String _searchName = '';
  String _errorMessage = '';

  CharacterProvider(this._characterRepository);

  CharacterState get state => _state;
  List<Character> get characters => _characters;
  int get totalPages => _totalPages;
  bool get isLoadingMore => _isLoadingMore;
  String get searchName => _searchName;
  String get errorMessage => _errorMessage;

  Future<void> getCharacters({bool loadMore = false, String? name}) async {
    if (loadMore) {
      if (_currentPage >= _totalPages || _state == CharacterState.loading || _isLoadingMore) return;
      _currentPage++;
      _isLoadingMore = true;
      notifyListeners();
    } else {
      if (name != null) {
        _searchName = name.trim();
      }
      _currentPage = 1;
      _isLoadingMore = false;
      _setState(CharacterState.loading);
    }

    try {
      final result = await _characterRepository.getCharacters(
        page: _currentPage,
        name: _searchName.isEmpty ? null : _searchName,
      );
      result.fold(
        (l) {
          if (loadMore) _currentPage--;
          if (!loadMore) _characters = [];
          _setState(CharacterState.error, errorMessage: l);
        },
        (r) {
          _totalPages = r.info.pages;
          _characters = loadMore ? [..._characters, ...r.results] : r.results;
          _setState(CharacterState.loaded);
        },
      );
    } finally {
      if (loadMore && _isLoadingMore) {
        _isLoadingMore = false;
        notifyListeners();
      }
    }
  }

  @protected
  void _setState(CharacterState state, {String? errorMessage}) {
    _state = state;
    _errorMessage = errorMessage ?? '';
    notifyListeners();
  }
}
