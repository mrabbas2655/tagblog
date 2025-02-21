class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.writer,
      required this.writerImageUrl,
      required this.date,
      required this.content,
      required this.views});
}

class BlogPadModel {
  int id;
  String imageUrl;
  String title;
  String writerImageUrl;
  String content;

  BlogPadModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writerImageUrl,
    required this.content,
  });
}
