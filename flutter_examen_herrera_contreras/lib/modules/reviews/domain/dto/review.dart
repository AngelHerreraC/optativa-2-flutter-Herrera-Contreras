class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;

  Review({required this.rating, required this.comment, required this.date, required this.reviewerName});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']), 
      reviewerName: json['reviewerName']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toString(),
      'reviewerName': reviewerName,
      'reviewerEmail': "sampleEmail@gmail.com"
    };
  }
}