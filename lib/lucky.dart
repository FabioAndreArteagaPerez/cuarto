class Lucky {
  final String frase;

  const Lucky({this.frase});

  @override
  List<Object> get props => [frase];

  static Lucky fromJson(dynamic json) {
    return Lucky(
      frase: json['Frase'],
    );
  }

  @override
  String toString() => 'Lucky { random }';
}
