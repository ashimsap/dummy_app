class Joke {
  final String type;
  final String setup;
  final String punchline;
  final String id; // Keeping id as String based on previous context, though usually IDs can be int or string.

  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'] ?? '',
      setup: json['setup']?.toString() ?? '',
      punchline: json['punchline'] ?? '',
      id: json['id']?.toString() ?? '',
    );
  }
}
