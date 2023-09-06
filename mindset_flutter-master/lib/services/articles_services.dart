import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindset_flutter/models/post.dart';

class ArticleServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  addNewArticle(Post article) async {
    await _firebaseFirestore.collection("posts").doc().set(article.toJson());
  }

  Stream<QuerySnapshot> fetchAllArticles() {
    return _firebaseFirestore.collection("posts").snapshots();
  }

  fetchArticleByID(String id) async {
    return await _firebaseFirestore.collection("posts").doc(id).get();

  }

  Future<void> addLike( String postID) async {
    await _firebaseFirestore.collection("pots").doc(postID).update({
      "liked_by": FieldValue.arrayUnion(([_firebaseAuth.currentUser!.uid])
      )});
  }

  Future<void> removeLike( String postID) async {
    await _firebaseFirestore.collection("post").doc(postID).update({
      "liked_by": FieldValue.arrayRemove(([_firebaseAuth.currentUser!.uid])
      )});
  }
  
}