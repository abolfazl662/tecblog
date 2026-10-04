//کانستراکتور
class HashTagConsTracTor {
  String title;
  HashTagConsTracTor({required this.title});
}
class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String data;
  String content;
  String views;
  BlogModel({required this.id,required this.imageUrl,required this.title,required this.writer,required this.writerImageUrl,required this.data,required this.content,required this.views});
}
class PosterHotPodCast {
  int id;
  String imageUrl;
  String title;
  PosterHotPodCast({required this.id,required this.imageUrl,required this.title});
}