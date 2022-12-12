extension RemoveAll on String {
  String removeAll(Iterable<String> values) => values.fold(
      //thisには#cfc9c2の形入ってる
      //0X#cfc9c2
      //0Xcfc9c2
      this,
      (
        String result,
        String pattern,
      ) =>
          result.replaceAll(pattern, ''));
}
