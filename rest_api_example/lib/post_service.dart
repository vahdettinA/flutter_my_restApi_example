import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rest_api_example/post.dart';

import 'package:rest_api_example/post_model.dart';

class PostService {
  final Dio _dio = Dio();
  static const _baseUrl = "http://127.0.0.1:5000";
  static const String _getpath = "$_baseUrl/getPosts";
  static const String _postPath = "$_baseUrl/createPosts";
  static const String _deletePath = "$_baseUrl/deletePosts/";
  Future<PostModel?> getPost() async {
    var res = await _dio.get(_getpath);
    if (res.statusCode == HttpStatus.ok) {
      var body = PostModel.fromJson(res.data);
      return body;
    }
    return null;
  }

  Future<bool> createPost(Post post) async {
    var res = await _dio.post(_postPath, data: {
      "name": post.name,
      "description": post.description,
      "date": post.date,
      "stock": post.stock
    });
    if (res.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }

  Future<bool> deletePost(String id) async {
    var res = await _dio.delete("$_deletePath$id");
    if (res.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
