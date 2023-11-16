import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _favoritos = [];
  List<DocumentReference> get favoritos => _favoritos;
  set favoritos(List<DocumentReference> value) {
    _favoritos = value;
  }

  void addToFavoritos(DocumentReference value) {
    _favoritos.add(value);
  }

  void removeFromFavoritos(DocumentReference value) {
    _favoritos.remove(value);
  }

  void removeAtIndexFromFavoritos(int index) {
    _favoritos.removeAt(index);
  }

  void updateFavoritosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favoritos[index] = updateFn(_favoritos[index]);
  }

  void insertAtIndexInFavoritos(int index, DocumentReference value) {
    _favoritos.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
