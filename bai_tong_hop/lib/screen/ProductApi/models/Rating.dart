
class Rating {
  dynamic rate;
  int count;
  
  Rating({
    required this.count,
    required this.rate
  });

  factory Rating.fromJson(Map<String , dynamic> json){
    return Rating(
      rate: json['rate'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
    
}

