
import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    String title;
    
    String content;
    String? coverUrl;
    String author;
    String createdAt;
    String readTime;
    int? nbLikes;
    int? nbComments;
    int? nbShares;
    int? nbViews;
    List<dynamic>? likedBy;

    Post({
        required this.title,
       
        required this.content,
        this.coverUrl,
        required this.author,
        required this.createdAt,
        required this.readTime,
        this.nbLikes,
        this.nbComments,
        this.nbViews,
        this.nbShares,
        this.likedBy,
    }); 

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        
        content: json["content"],
        coverUrl: json["cover_url"] ?? "",
        author: json["author"],
        createdAt: json["created_at"],
        readTime: json["read_time"],
        nbLikes: json["nb_likes"] ?? 0,
        nbComments: json["nb_comments"] ?? 0,
        nbShares: json["nb_shares"] ?? 0,
        nbViews: json["nb_views"] ?? 0,
        likedBy: List<String>.from(json["likeed_by"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        
        "content": content,
        "cover_url": coverUrl ?? "",
        "author": author,
        "created_at": createdAt,
        "read_time": readTime,
        "nb_likes": nbLikes ?? 0,
        "nb_comments": nbComments ?? 0,
        "nb_shares": nbShares ?? 0,
        "nb_views": nbViews ?? 0,
        "liked_by": List<dynamic>.from(likedBy!.map((x) => x)),
    };
}
