class Album {
  final int status;
  final String message;

  Album({this.status, this.message});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status: json['status'],
      message: json['message'],
    );
  }
}
