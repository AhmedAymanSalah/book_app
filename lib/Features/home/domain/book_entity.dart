class BookEntity {
  final String bookId;
  final String image;
  final String title;
  final String authorName;
  final num rating;
  final num price;

  BookEntity(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.authorName,
      required this.rating,
      required this.price});
}
