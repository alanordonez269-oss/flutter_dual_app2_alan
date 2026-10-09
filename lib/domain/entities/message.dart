enum Fromwho { mine, hers }

class Message {
  final String text;
  final String? imageURL;
  final Fromwho fromwho;

  Message({required this.text, this.imageURL, required this.fromwho});
}
