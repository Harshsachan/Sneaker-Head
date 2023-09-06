class RatingsAndReview {
  Data? data;

  RatingsAndReview({this.data});

  RatingsAndReview.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<FindReviewsAndRatingsByProductId>? findReviewsAndRatingsByProductId;

  Data({this.findReviewsAndRatingsByProductId});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['findReviewsAndRatingsByProductId'] != null) {
      findReviewsAndRatingsByProductId = <FindReviewsAndRatingsByProductId>[];
      json['findReviewsAndRatingsByProductId'].forEach((v) {
        findReviewsAndRatingsByProductId!
            .add( FindReviewsAndRatingsByProductId.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (findReviewsAndRatingsByProductId != null) {
      data['findReviewsAndRatingsByProductId'] =
          findReviewsAndRatingsByProductId!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class FindReviewsAndRatingsByProductId {
  String? customerEmail;
  String? customerFullName;
  int? rating;
  String? review;
  int? productIds;

  FindReviewsAndRatingsByProductId(
      {this.customerEmail,
        this.customerFullName,
        this.rating,
        this.review,
        this.productIds});

  FindReviewsAndRatingsByProductId.fromJson(Map<String, dynamic> json) {
    customerEmail = json['customer_email'];
    customerFullName = json['customer_full_name'];
    rating = json['rating'];
    review = json['review'];
    productIds = json['product_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['customer_email'] = customerEmail;
    data['customer_full_name'] = customerFullName;
    data['rating'] = rating;
    data['review'] = review;
    data['product_ids'] = productIds;
    return data;
  }
}