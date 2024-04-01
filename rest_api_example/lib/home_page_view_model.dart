import 'package:flutter/material.dart';
import 'package:rest_api_example/home_page.dart';
import 'package:rest_api_example/post.dart';
import 'package:rest_api_example/post_model.dart';
import 'package:rest_api_example/post_service.dart';

mixin HomePageViewModel on State<HomePage> {
  PostService service = PostService();
  List<GetPost> data = [];
  @override
  void initState() {
    doldur();
    super.initState();
  }

  void doldur() {
    service.getPost().then((value) {
      setState(() {
        data = value!.getPost!;
      });
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Future<dynamic> myshowDialog(BuildContext context);
  void delete(String id) {
    service.deletePost(id).then((value) {
      setState(() {
        data.clear();
        doldur();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 400),
          content: value
              ? const Text("Silme işlemi başaraılı")
              : const Text("Silme işlemi yapılaması")));
    });
  }

  void create() {
    if (nameController.text.isNotEmpty && descController.text.isNotEmpty) {
      service
          .createPost(
              Post(name: nameController.text, description: descController.text))
          .then((value) {
        if (value) {
          doldur();
        }
      });
    }
  }
}
