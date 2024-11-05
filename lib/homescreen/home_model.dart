// To parse this JSON data, do
//
//     final homeScreenJsonModel = homeScreenJsonModelFromJson(jsonString);

import 'dart:convert';

HomeScreenJsonModel homeScreenJsonModelFromJson(String str) => HomeScreenJsonModel.fromJson(json.decode(str));

String homeScreenJsonModelToJson(HomeScreenJsonModel data) => json.encode(data.toJson());

class HomeScreenJsonModel {
    List<Datum>? data;

    HomeScreenJsonModel({
        this.data,
    });

    factory HomeScreenJsonModel.fromJson(Map<String, dynamic> json) => HomeScreenJsonModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? blockType;
    String? name;
    String? heading;
    int? position;
    int? count;
    bool? active;
    String? createdAt;
    String? updatedAt;
    String? vertical;
    dynamic createdBy;
    String? modifiedBy;
    List<Post>? posts;

    Datum({
        this.id,
        this.blockType,
        this.name,
        this.heading,
        this.position,
        this.count,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.vertical,
        this.createdBy,
        this.modifiedBy,
        this.posts,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        blockType: json["block_type"],
        name: json["name"],
        heading: json["heading"],
        position: json["position"],
        count: json["count"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        vertical: json["vertical"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "block_type": blockType,
        "name": name,
        "heading": heading,
        "position": position,
        "count": count,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "vertical": vertical,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Post {
    String? id;
    List<FileElement>? files;
    bool? likedByMe;
    String? title;
    String? postType;
    String? description;
    String? metadata;
    String? fullVideoUrl;
    String? blogUrl;
    bool? active;
    bool? featured;
    int? priority;
    int? likes;
    String? createdAt;
    String? updatedAt;
    String? createdBy;
    String? layout;
    dynamic persona;
    String? modifiedBy;

    Post({
        this.id,
        this.files,
        this.likedByMe,
        this.title,
        this.postType,
        this.description,
        this.metadata,
        this.fullVideoUrl,
        this.blogUrl,
        this.active,
        this.featured,
        this.priority,
        this.likes,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.layout,
        this.persona,
        this.modifiedBy,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        likedByMe: json["liked_by_me"],
        title: json["title"],
        postType: json["post_type"],
        description: json["description"],
        metadata: json["metadata"],
        fullVideoUrl: json["full_video_url"],
        blogUrl: json["blog_url"],
        active: json["active"],
        featured: json["featured"],
        priority: json["priority"],
        likes: json["likes"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        layout: json["layout"],
        persona: json["persona"],
        modifiedBy: json["modified_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "liked_by_me": likedByMe,
        "title": title,
        "post_type": postType,
        "description": description,
        "metadata": metadata,
        "full_video_url": fullVideoUrl,
        "blog_url": blogUrl,
        "active": active,
        "featured": featured,
        "priority": priority,
        "likes": likes,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "layout": layout,
        "persona": persona,
        "modified_by": modifiedBy,
    };
}

class FileElement {
    String? id;
    String? mediaType;
    String? videoUrl;
    String? thumbnail;
    String? imagePath;
    int? mediaOrder;
    dynamic ratio;
    bool? active;
    String? post;

    FileElement({
        this.id,
        this.mediaType,
        this.videoUrl,
        this.thumbnail,
        this.imagePath,
        this.mediaOrder,
        this.ratio,
        this.active,
        this.post,
    });

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        mediaType: json["media_type"],
        videoUrl: json["video_url"],
        thumbnail: json["thumbnail"],
        imagePath: json["image_path"],
        mediaOrder: json["media_order"],
        ratio: json["ratio"],
        active: json["active"],
        post: json["post"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "video_url": videoUrl,
        "thumbnail": thumbnail,
        "image_path": imagePath,
        "media_order": mediaOrder,
        "ratio": ratio,
        "active": active,
        "post": post,
    };
}
