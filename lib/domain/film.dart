class Film {
  final String id;
  final String title;
  final String image;
  final String movieBanner;
  final String description;
  final String releaseDate;
  final String director;
  final String rtScore;
  final String runningTime;
  final bool isExpanded;

  const Film ({
    required this.id,
    required this.title,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.releaseDate,
    required this.director,
    required this.rtScore,
    required this.runningTime,
    required this.isExpanded
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      movieBanner: json['movie_banner'],
      description: json['description'],
      releaseDate: json['release_date'],
      director: json['director'],
      rtScore: json['rt_score'],
      runningTime: json['running_time'],
      isExpanded: false
    );
  }

  @override
  String toString() {
    return "$id, $title, $image, $movieBanner, $description, $releaseDate, $director, $rtScore, $runningTime";
  }

}