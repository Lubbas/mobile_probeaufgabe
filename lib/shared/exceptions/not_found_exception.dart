class BreedNotFoundException implements Exception {
  BreedNotFoundException(this.id);
  final String id;
  @override
  String toString() => 'Rasse mit id "$id" konnte nicht gefunden werden.';
}
