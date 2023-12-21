import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User(
      {required this.username,
        required this.uid,
        required this.photoUrl,
        required this.email,
        required this.bio,
        required this.followers,
        required this.following});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshotData = snap.data() as Map<String, dynamic>?;

    if (snapshotData == null) {
      // Handle the case where the data is null, e.g., by returning a default User object or throwing a specific exception.
      // For example, returning a default User object:
      // return User(username: "Default Username", uid: "Default UID", ...);

      // Or throwing a specific exception:
      throw Exception("User data is null");
    }

    // Handle individual fields being null, providing default values or handling null cases appropriately
    String username = snapshotData["username"] ?? "";
    String uid = snapshotData["uid"] ?? "";
    String email = snapshotData["email"] ?? "";
    String photoUrl = snapshotData["photoUrl"] ?? "";
    String bio = snapshotData["bio"] ?? "";
    List followers = snapshotData["followers"] ?? [];
    List following = snapshotData["following"] ?? [];

    return User(
      username: username,
      uid: uid,
      email: email,
      photoUrl: photoUrl,
      bio: bio,
      followers: followers,
      following: following,
    );
  }



  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    "followers": followers,
    "following": following,
  };
}